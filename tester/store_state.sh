#!/usr/bin/env bash
# this funciton is used to store the state of core flannel vars
_flannel_tester_store_state() {
  export PLAID_SHEEP_BACKUP="$PLAID_SHEEP"
  export PLAID_CRUMBS_BACKUP="$PLAID_CRUMBS"
  export PLAID_SPOOL_BACKUP="$PLAID_SPOOL"
}