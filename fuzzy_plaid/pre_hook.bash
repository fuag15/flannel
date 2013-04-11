#!/usr/bin/env bash
# `plaid_pre_hook` <function_name> [clear]
# - if clear
#  - remove it
#  - return
# - if not in hooks
#  - append it
plaid_pre_hook() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    export PLAID_PRE_HOOKS="${PLAID_PRE_HOOKS//:$1:/}"; return
  fi

  if [[ "$PLAID_PRE_HOOKS" != *":$1:"* ]]; then
    export PLAID_PRE_HOOKS="$PLAID_PRE_HOOKS:$1:"
  fi
}