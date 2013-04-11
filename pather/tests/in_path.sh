#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "in_path_front"
  in_path_front() {
    export PLAID_PATHER_TEST="test/path/one:test/path/two:/test/path/three:"
    in_path "test/path/one"
  }

  add_plaid_spec "in_path_middle"
  in_path_middle() {
    export PLAID_PATHER_TEST="test/path/one:test/path/two:/test/path/three:"
    in_path "test/path/two"
  }

  add_plaid_spec "in_path_end"
  in_path_end() {
    export PLAID_PATHER_TEST="test/path/one:test/path/two:/test/path/three:"
    in_path "test/path/end"
  }
fi