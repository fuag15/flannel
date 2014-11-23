#!/usr/bin/env bash
# `flannel_pre_hook` <function_name> [clear]
# - if clear
#  - remove it
#  - return
# - if not in hooks
#  - append it
flannel_pre_hook() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    export FLANNEL_PRE_HOOKS="${FLANNEL_PRE_HOOKS//:$1:/}"; return
  fi

  if [[ "$FLANNEL_PRE_HOOKS" != *":$1:"* ]]; then
    export FLANNEL_PRE_HOOKS="$FLANNEL_PRE_HOOKS:$1:"
  fi
}
