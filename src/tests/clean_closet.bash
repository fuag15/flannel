#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "clean_closet_clear_spec"
  clean_closet_clear_spec() {
    load_modules "fuzzy_plaid"
    clean_closet "fuzzy_plaid" "clear"
    [[ "$FLANNEL_STATE" == *"fuzzy_plaid"* ]]
  }
fi