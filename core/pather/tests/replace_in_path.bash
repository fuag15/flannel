#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "replace_in_path_clear_test"
  replace_in_path_clear_test() {
    create_path "PLAID_PATHER_TEST" "test/path/one"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    create_path "PLAID_PATHER_TEST" "test/path/three"
    replace_in_path "PLAID_PATHER_TEST" "test/path/one" "test/path/four"
    [[ "$PLAID_PATHER_TEST" == *"test/path/four"* ]]
  }

  add_plaid_spec "replace_in_path_clear_reversal_test"
  replace_in_path_clear_reversal_test() {
    create_path "PLAID_PATHER_TEST" "test/path/one"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    create_path "PLAID_PATHER_TEST" "test/path/three"
    replace_in_path "PLAID_PATHER_TEST" "test/path/one" "test/path/four"
    replace_in_path "PLAID_PATHER_TEST" "test/path/one" "test/path/four" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path/four"* ]]
  }

  add_plaid_spec "replace_in_path_create_test"
  replace_in_path_create_test() {
    replace_in_path "PLAID_PATHER_TEST" "test/path/one" "test/path/two"
    [[ "$PLAID_PATHER_TEST" == *"test/path/two"* ]]
  }

  add_plaid_spec "replace_in_path_clear_middle_test"
  replace_in_path_clear_middle_test() {
    create_path "PLAID_PATHER_TEST" "test/path/one"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    create_path "PLAID_PATHER_TEST" "test/path/three"
    replace_in_path "PLAID_PATHER_TEST" "test/path/two" "test/path/four"
    [[ "$PLAID_PATHER_TEST" != *"test/path/two"* ]]
  }

  add_plaid_spec "replace_in_path_clear_end_test"
  replace_in_path_clear_end_test() {
    create_path "PLAID_PATHER_TEST" "test/path/one"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    create_path "PLAID_PATHER_TEST" "test/path/three"
    replace_in_path "PLAID_PATHER_TEST" "test/path/three" "test/path/four"
    [[ "$PLAID_PATHER_TEST" != *"test/path/three"* ]]
  }
fi
