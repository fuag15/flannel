#!/usr/bin/env bash
# dont leave a mess for the next generation man
# This function clears our breadcrumb type env var between each load request
_flannel_fuzzy_plaid_clean_table() {
  # if we left crumbs, clean them up!
  if [[ -n "$FLANNEL_CRUMBS" ]]; then
    unset FLANNEL_CRUMBS
  fi
}