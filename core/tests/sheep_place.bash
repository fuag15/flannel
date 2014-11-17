#!/usr/bin/env bash

if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "place_sheep_empty_test"
  place_sheep_empty_test() {
    _flannel_core_spool_add "baaa"
    [[ "$FLANNEL_SPOOL" == *"baaa"* ]]
  }

  add_plaid_spec "place_sheep_clear_test"
  place_sheep_clear_test() {
    _flannel_core_spool_add "baaa" "clear"
    [[ "$FLANNEL_SPOOL" != *"baaa"* ]]
  }
fi