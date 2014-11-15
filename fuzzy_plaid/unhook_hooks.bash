#!/usr/bin/env bash
# `flannel_unhook_hooks` [{pre,post}]
# - if pre
#  - unset pre
# - elif post
#  - unset post
# - else
#  - unset both
flannel_unhook_hooks() {
  if [[ "$1" == "pre" ]]; then
    unset PLAID_PRE_HOOKS
  elif [[ "$1" == "post" ]]; then
    unset PLAID_POST_HOOKS
  else
    unset PLAID_PRE_HOOKS
    unset PLAID_POST_HOOKS
  fi
}