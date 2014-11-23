#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "remove_from_path_clear_test"
  remove_from_path_clear_test() {
    remove_from_path "PLAID_PATHER_TEST" "test/path" "clear"
    [[ "$PLAID_PATHER_TEST" == *"test/path"* ]]
  }

  add_plaid_spec "remove_from_path_clear_existing_test"
  remove_from_path_clear_existing_test() {
    create_path "PLAID_PATHER_TEST" "test/path"
    remove_from_path "PLAID_PATHER_TEST" "test/path"
    [[ "$PLAID_PATHER_TEST" != *"test/path"* ]]
  }

  add_plaid_spec "remove_from_path_middle_test"
  remove_from_path_middle_test() {
    create_path "PLAID_PATHER_TEST" "test/path/one"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    create_path "PLAID_PATHER_TEST" "test/path/three"
    remove_from_path "PLAID_PATHER_TEST" "test/path/two"
    [[ "$PLAID_PATHER_TEST" != *"test/path/two"* ]]
  }

  add_plaid_spec "remove_from_path_end_existing_test"
  remove_from_path_end_existing_test() {
    create_path "PLAID_PATHER_TEST" "test/path/one"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    create_path "PLAID_PATHER_TEST" "test/path/three"
    remove_from_path "PLAID_PATHER_TEST" "test/path/three"
    [[ "$PLAID_PATHER_TEST" != *"test/path/three"* ]]
  }

  add_plaid_spec "remove_from_path_start_existing_test"
  remove_from_path_start_existing_test() {
    create_path "PLAID_PATHER_TEST" "test/path/one"
    create_path "PLAID_PATHER_TEST" "test/path/two"
    create_path "PLAID_PATHER_TEST" "test/path/three"
    remove_from_path "PLAID_PATHER_TEST" "test/path/one"
    [[ "$PLAID_PATHER_TEST" != *"test/path/one"* ]]
  }
fi

remove_from_path() {
  # if we get a clear command undo what this does
  if [[ "${@:(-1)}" == "clear" ]]; then
    append_path "${@:1:(($#-1))}"
    return
  fi

  # could be the only thing in path
  if [[ "${!1}" == "$2" ]]; then
    unset "$1"
    return
  fi

  # clear from beggining
  local path_contents="${!1#${2}:}"

  # clear from middle of path
  path_contents="${path_contents//:${2}:/:}"

  # clear from end of path
  export "$1"="${path_contents%:$2}"
}
