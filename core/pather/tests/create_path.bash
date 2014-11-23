#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "create_path_clear_test"
  create_path_clear_test() {
    create_path "PLAID_PATHER_TEST" "test/path" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path"* ]]
  }

  add_plaid_spec "create_path_clear_existing_test"
  create_path_clear_existing_test() {
    create_path "PLAID_PATHER_TEST" "test/path"
    create_path "PLAID_PATHER_TEST" "test/path" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path"* ]]
  }

  add_plaid_spec "create_path_create_test"
  create_path_create_test() {
    create_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" == *"test/path"* ]]
  }

  add_plaid_spec "create_path_create_existing_test"
  create_path_create_existing_test() {
    create_path "PLAID_PATHER_TEST" "test/path"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    [[ "$PLAID_PATHER_TEST" == *"test/path/two"* ]]
  }
fi
