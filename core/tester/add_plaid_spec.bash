#!/usr/bin/env bash
# use this to add tests to the global test list
add_plaid_spec() {
  export PLAID_SPEC="$PLAID_SPEC $1"
}
