#!/usr/bin/env bash
# this function helps do version logic on requirements for bounded things
# this expects to recieve the optional `clear` variable from your flannel
# syntax: requires_bounded_plaid <module> <lower bound> <upper bound> [<default> clear]
# if we got a clear
#   return
# if its in our spool
#   if its equal to either upper or lower, return
#   if its higher than lower and lower than upper, return
# flannel our second to last param
requires_bounded_plaid() {
  # if we got a clear then we dont need to check requirements
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  # if it is in our spool
  if [[ "$PLAID_SPOOL" == *":$1"* ]]; then

    # else we got an equality op, lets check it out first if it is equal then return
    if [[ "$PLAID_SPOOL" == *":$1/$2;"* || "$PLAID_SPOOL" == *":$1/$3;" ]]; then
      return
    fi

    # get our existing version info
    local existing_version="${PLAID_SPOOL#*:$1/}"

    # else it is time to check our equality, if false load
    if declare -f _flannel_"$1"_comparator >/dev/null; then
      # if its greater than lower 
      if _flannel_"$1"_comparator "${existing_version%%;*}" ">" "$2"; then
        # and less than upper
        if _flannel_"$1"_comparator "${existing_version%%;*}" "<" "$3"; then
          return
        fi
      fi
    else # use default
      # if its greater than lower 
      if _flannel_catch_all_comparator "${existing_version%%;*}" ">" "$2"; then
        # and less than upper
        if _flannel_catch_all_comparator "${existing_version%%;*}" "<" "$3"; then
          return
        fi
      fi
    fi
  fi 
  # if we got here then we need to fix the error, or it wasn't in our spool
  # flannel the last variable, allows for defaults
  flannel "$1/${@:(-1)}"
}