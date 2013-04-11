#!/usr/bin/env bash

if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "stitch_sheep_test"
  stitch_sheep_test() {
    _flannel_place_sheep "baaa"
    _flannel_sheep_stitch "baaa"
    [[ "$PLAID_SHEEP" != *"baaa"* ]]
  }

  add_plaid_spec "place_sheep_clear_test"
  place_sheep_clear_test() {
    _flannel_place_sheep "baaa"
    _flannel_sheep_stitch "baaa" "clear"
    [[ "$PLAID_SHEEP" == *"baaa"* ]]
  }
fi