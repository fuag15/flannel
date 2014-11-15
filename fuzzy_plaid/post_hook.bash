#!/usr/bin/env bash
# `flannel_post_hook` <function_name> [clear]
# - if clear
#  - remove it
#  - return
# - if not in hooks
#  - append it
flannel_post_hook() {
  if [[ "${@:(-1)}" == "clear" ]]; then
    export PLAID_POST_HOOKS="${PLAID_POST_HOOKS//:$1:/}"; return
  fi

  if [[ "$PLAID_POST_HOOKS" != *":$1:"* ]]; then
    export PLAID_POST_HOOKS="$PLAID_POST_HOOKS:$1:"
  fi
}