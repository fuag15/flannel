#!/usr/bin/env bash
# this function helps do version logic on requirements
# you can do logic such as <= >= or == in requirements.
# this expects to recieve the optional `clear` variable from your flannel
# syntax: requires_plaid <module> [{>=,<=,==} <version>] [clear]
# if it gets passed no version or operator, it assumes it just needs the module to be present
# on a clear we do nothing
# if we get a clear we return
# if its in our spool
# then we do some logic to find out if our versions are satisfactory
# @odgrim pointed out the character comparison gives us larger or smaller versions
# else its not in our spool so just flannel the given version
# or just flannel the module
requires_plaid() {
  # if we got a clear then we dont need to check requirements
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  # if it is in our spool
  if [[ "$PLAID_SPOOL" == *"$1"* ]]; then

    # if our second parramater doesnt contain an equal were done
    if [[ "$2" != *"="* ]]; then
      return
    fi

    # else we got an equality op, lets check it out first if it is equal then return
    if [[ "$PLAID_SPOOL" == *"$1/$3:"* ]]; then
      return
    fi

    # else it is time to check our equality
    # lets get the first different character
    local diff_char_current
    local diff_char_needed
    # this logic is not as simple as thought
    # need to think about how to compare

    # then lets compare them, we invert the test so we get a positive if its bad
    if [[ "${diff_char_needed}" "${2%=}" "$diff_char_current" ]]; then
      # we dont have a satisfactory version! flannel it
      flannel "$1/$3"
    fi
  else # its not even in our spool!
    # if our second paramter doesn't contain an equal, just flannel the base
    if [[ "$2" != *"="* ]]; then
      flannel "$1"
    else
      flannel "$1/$3"
    fi
  fi
}