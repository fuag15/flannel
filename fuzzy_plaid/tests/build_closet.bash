#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "build_closet_spec"
  build_closet_spec() {
    build_closet "fuzzy_plaid"
    [[ "$FLANNEL_STATE" == *"fuzzy_plaid"* ]]
  }
fi