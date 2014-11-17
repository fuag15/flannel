#!/usr/bin/env bash
# adds some sheep to our line of in process flannel modules
# syntax: `pace_sheep <module> [clear]
# - on clear return
# - else if its not in the path place it in
_flannel_spool_add() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  if [[ "$FLANNEL_SPOOL" != *":$1;"* ]]; then
    export FLANNEL_SPOOL="$FLANNEL_SPOOL:$1;"
  fi
}