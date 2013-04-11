#!/usr/bin/env bash

# tests for append path
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "append_path_clear_test"
  append_path_clear_test() {
    append_path "PLAID_PATHER_TEST" "test/path" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path"* ]]
  }

  add_plaid_spec "append_path_in_path_test"
  append_path_in_path_test() {
    append_path "PLAID_PATHER_TEST" "test/path"
    append_path "PLAID_PATHER_TEST" "test/path/two"
    append_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" == *"test/path" ]]
  }

  add_plaid_spec "append_path_blank_new_test"
  append_path_blank_new_test() {
    append_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" == *"test/path"* ]]
  }

  add_plaid_spec "append_path_non_empty_new_test"
  append_path_non_empty_new_test() {
    append_path "PLAID_PATHER_TEST" "test/path/two"
    append_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" == *"test/path" ]]
  }

  add_plaid_spec "append_path_remove_single_test"
  append_path_remove_single_test() {
    append_path "PLAID_PATHER_TEST" "test/path"
    append_path "PLAID_PATHER_TEST" "test/path" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path"* ]]
  }

  add_plaid_spec "append_path_remove_begining_test"
  append_path_remove_begining_test() {
    append_path "PLAID_PATHER_TEST" "test/path/one"
    append_path "PLAID_PATHER_TEST" "test/path/two"
    append_path "PLAID_PATHER_TEST" "test/path/three"
    append_path "PLAID_PATHER_TEST" "test/path/one" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path/one"* ]]
  }

  add_plaid_spec "append_path_remove_middle_test"
  append_path_remove_middle_test() {
    append_path "PLAID_PATHER_TEST" "test/path/one"
    append_path "PLAID_PATHER_TEST" "test/path/two"
    append_path "PLAID_PATHER_TEST" "test/path/three"
    append_path "PLAID_PATHER_TEST" "test/path/two" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path/two"* ]] 
  }

  add_plaid_spec "append_path_remove_end_test"
  append_path_remove_end_test() {
    append_path "PLAID_PATHER_TEST" "test/path/one"
    append_path "PLAID_PATHER_TEST" "test/path/two"
    append_path "PLAID_PATHER_TEST" "test/path/three"
    append_path "PLAID_PATHER_TEST" "test/path/three" "clear"
    [[ "$PLAID_PATHER_TEST" != *"test/path/three"* ]]
  }
fi