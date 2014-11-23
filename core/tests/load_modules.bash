#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "load_modules_spec"
  load_modules_spec() {
    load_modules "fuzzy_plaid"
    [[ "$FLANNEL_STATE" == *"fuzzy_plaid"* ]]
  }
fi
