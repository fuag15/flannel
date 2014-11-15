#!/usr/bin/env bash

if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "stitch_sheep_test"
  stitch_sheep_test() {
    _flannel_spool_add "baaa"
    _flannel_spool_remove "baaa"
    [[ "$FLANNEL_SPOOL" != *"baaa"* ]]
  }

  add_plaid_spec "place_sheep_clear_test"
  place_sheep_clear_test() {
    _flannel_spool_add "baaa"
    _flannel_spool_remove "baaa" "clear"
    [[ "$FLANNEL_SPOOL" == *"baaa"* ]]
  }
fi