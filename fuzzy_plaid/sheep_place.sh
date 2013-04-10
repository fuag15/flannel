#!/usr/bin/env bash
# adds some sheep to our line of in process flannel modules
# syntax: `pace_sheep <module> [clear]
# - on clear return
# - else if its not in the path place it in
_flannel_place_sheep() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  if [[ "$PLAID_SHEEP" != *":$1;"* ]]; then
    export PLAID_SHEEP="$PLAID_SHEEP:$1;"
  fi
}