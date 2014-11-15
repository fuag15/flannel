#!/usr/bin/env bash

if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "plaid_spool_test"
  plaid_spool_test() {
    _flannel_fuzzy_plaid_spool_plaid "baaa"
    [[ "$FLANNEL_STATE" == *"baaa"* ]]
  }

  add_plaid_spec "plaid_spool_clear_test"
  plaid_spool_clear_test() {
    _flannel_fuzzy_plaid_spool_plaid "baaa"
    _flannel_fuzzy_plaid_spool_plaid "baaa" "clear"
    [[ "$FLANNEL_STATE" != *"baaa"* ]]
  }
fi