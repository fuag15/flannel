#!/usr/bin/env bash
# stitch a sheep from the crowd
# syntax `stitch <module> [clear]
# 1. on a clear ignore
# 2. take one away
_flannel_core_spool_remove() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  export FLANNEL_SPOOL="${FLANNEL_SPOOL//:$1;/}"
}
