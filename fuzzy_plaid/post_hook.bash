#!/usr/bin/env bash
# `plaid_post_hook` <function_name> [clear]
# - if clear
#  - remove it
#  - return
# - if not in hooks
#  - append it
plaid_post_hook() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    export PLAID_POST_HOOKS="${PLAID_POST_HOOKS//:$1:/}"; return
  fi

  if [[ "$PLAID_POST_HOOKS" != *":$1:"* ]]; then
    export PLAID_POST_HOOKS="$PLAID_POST_HOOKS:$1:"
  fi
}