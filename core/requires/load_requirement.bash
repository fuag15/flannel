#!/usr/bin/env bash
# this function helps do version logic on requirements
# you can do logic such as <= >= or == in requirements.
# this expects to recieve the optional `clear` variable from your flannel
# syntax: load_requirement <module> [{>=,<=,==} <version> <default>] [clear]
# if it gets passed no version or operator, it assumes it just needs the module to be present
# on a clear we do nothing
# if we get a clear we return
# if its in our spool
# then we do some logic to find out if our versions are satisfactory
# @odgrim pointed out the character comparison gives us larger or smaller versions
# else its not in our spool so just flannel the given version
# or just flannel the module
load_requirement() {
  # if we got a clear then we dont need to check requirements
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  # if it is in our spool
  if [[ "$FLANNEL_STATE" == *":$1"* ]]; then

    # if our second parramater doesnt contain an equal were done
    if [[ "$2" != *"="* ]]; then
      return
    fi

    # else we got an equality op, lets check it out first if it is equal then return
    if [[ "$FLANNEL_STATE" == *":$1/$3;"* ]]; then
      return
    fi

    # get our existing version info
    local existing_version="${FLANNEL_STATE#*:$1/}"

    # else it is time to check our equality, if false load
    if declare -f _flannel_core_"$1"_comparator >/dev/null; then
      # if its satisfied then
      if _flannel_core_"$1"_comparator "${existing_version%%;*}" "${2%=}" "$3"; then
        return
      fi
    else # use default
      if _flannel_core_catch_all_comparator "${existing_version%%;*}" "${2%=}" "$3"; then
        return
      fi
    fi
  fi 
  # if we got here then we need to fix the error, or it wasn't in our spool
    # if our second paramter doesn't contain an equal, just flannel the base
  if [[ "$2" != *"="* ]]; then
    flannel "$1"
  else # flannel the last variable, allows for defaults
    flannel "$1/${@:(-1)}"
  fi
}
