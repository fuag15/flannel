#!/usr/bin/env bash
# maintains state snapshot by adding or removing modules from PLAID_SPOOL
# syntax: spool_plaid <module> [clear]
# if we got a clear, remove and return
# if its not in the path
#   add it to the path
_flannel_fuzzy_plaid_spool_plaid() {
  # if we got a clear
  if [[ "${@:(-1)}" == "clear" ]]; then
    # remove our flannel
    export PLAID_SPOOL="${PLAID_SPOOL//$1:/}"; return
  fi

  # is it not in the path?
  if [[ "$PLAID_SPOOL" != *"$1:"* ]]; then

    # remove base versions if they are there
    if [[ "$PLAID_SPOOL" == *"${1%%/[[:digit:]]*}"* ]]; then
      # remove the base
      local base="${1%%/[[:digit:]]*}"
      export PLAID_SPOOL="${PLAID_SPOOL/$base:/}"
    fi

    # add it to the path
    export PLAID_SPOOL="${PLAID_SPOOL}${1}:"
  fi
}