#!/usr/bin/env bash
# maintains state snapshot by adding or removing modules from FLANNEL_STATE
# syntax: spool_plaid <module> [clear]
# if we got a clear, remove and return
# if its not in the path
#   add it to the path
_flannel_core_update_state() {
  # if we got a clear
  if [[ "${@:(-1)}" == "clear" ]]; then
    # remove our flannel
    export FLANNEL_STATE="${FLANNEL_STATE//:$1;/}"; return
  fi

  # is it not in the path?
  if [[ "$FLANNEL_STATE" != *":$1;"* ]]; then

    # remove base versions if they are there
    if [[ "$FLANNEL_STATE" == *":${1%%/[[:digit:]]*}"* ]]; then
      # remove the base
      local base="${1%%/[[:digit:]]*}"
      export FLANNEL_STATE="${FLANNEL_STATE/:$base;/}"
    fi

    # add it to the path
    export FLANNEL_STATE="${FLANNEL_STATE}:${1};"
  fi
}