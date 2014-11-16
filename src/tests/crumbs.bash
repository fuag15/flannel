#!/usr/bin/env bash

# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "plaid_crumbs_not_exist_test"
  plaid_crumbs_not_exist_test() {
    _flannel_track_revdeps "test/module"
    [[ "$?" == "1" ]]
  }

  add_plaid_spec "plaid_crumbs_exist_test"
  plaid_crumbs_exist_test() {
    _flannel_track_revdeps "test/module"
    _flannel_track_revdeps "test/module"
  }
fi