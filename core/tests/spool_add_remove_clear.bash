#!/usr/bin/env bash

if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "add_and_remove_test"
  add_and_remove_test() {
    _flannel_core_spool_add "baaa"
    _flannel_core_spool_remove "baaa"
    [[ "$FLANNEL_SPOOL" != *"baaa"* ]]
  }

  add_plaid_spec "spool_add_clear_test"
  spool_add_clear_test() {
    _flannel_core_spool_add "baaa"
    _flannel_core_spool_remove "baaa" "clear"
    [[ "$FLANNEL_SPOOL" == *"baaa"* ]]
  }
fi
