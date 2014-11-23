#!/usr/bin/env bash
# tests for prepend path
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "prepend_path_clear_test"
  prepend_path_clear_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path"* ]]
  }

  add_plaid_spec "prepend_path_in_path_test"
  prepend_path_in_path_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path"
    prepend_path "PLAID_PATHER_TEST" "test/path/two"
    prepend_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" == "test/path"* ]]
  }

  add_plaid_spec "prepend_path_blank_new_test"
  prepend_path_blank_new_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" == *"test/path"* ]]
  }

  add_plaid_spec "prepend_path_non_empty_new_test"
  prepend_path_non_empty_new_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path/two"
    prepend_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" == "test/path"* ]]
  }

  add_plaid_spec "prepend_path_remove_single_test"
  prepend_path_remove_single_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path"
    prepend_path "PLAID_PATHER_TEST" "test/path" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path"* ]]
  }

  add_plaid_spec "prepend_path_remove_begining_test"
  prepend_path_remove_begining_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path/one"
    prepend_path "PLAID_PATHER_TEST" "test/path/two"
    prepend_path "PLAID_PATHER_TEST" "test/path/three"
    prepend_path "PLAID_PATHER_TEST" "test/path/one" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path/one"* ]]
  }

  add_plaid_spec "prepend_path_remove_middle_test"
  prepend_path_remove_middle_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path/one"
    prepend_path "PLAID_PATHER_TEST" "test/path/two"
    prepend_path "PLAID_PATHER_TEST" "test/path/three"
    prepend_path "PLAID_PATHER_TEST" "test/path/two" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path/two"* ]] 
  }

  add_plaid_spec "prepend_path_remove_end_test"
  prepend_path_remove_end_test() {
    prepend_path "PLAID_PATHER_TEST" "test/path/one"
    prepend_path "PLAID_PATHER_TEST" "test/path/two"
    prepend_path "PLAID_PATHER_TEST" "test/path/three"
    prepend_path "PLAID_PATHER_TEST" "test/path/three" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path/three"* ]]
  }
fi
