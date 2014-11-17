#!/usr/bin/env bash
# safety isn't bad
if declare -f add_plaid_spec >/dev/null; then
  add_plaid_spec "catch_all_eq_test"
  catch_all_eq_test() {
    _flannel_core_catch_all_comparator "1.8.3" "=" "1.8.3" 
  }

  add_plaid_spec "catch_all_gt_test"
  catch_all_gt_test() {
    _flannel_core_catch_all_comparator "1.8.3" ">" "1.8.2" 
  }

  add_plaid_spec "catch_all_lt_test"
  catch_all_lt_test() {
    _flannel_core_catch_all_comparator "1.8.3" "<" "1.8.4" 
  }
fi