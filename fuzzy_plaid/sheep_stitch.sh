#!/usr/bin/env bash
# stitch a sheep from the crowd
# syntax `stitch <module> [clear]
# 1. on a clear ignore
# 2. take one away
_flannel_sheep_stitch() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  export PLAID_SHEEP="${PLAID_SHEEP//:$1/}"
}