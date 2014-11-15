#!/usr/bin/env bash
# this funciton is used to store the state of core flannel vars
_flannel_tester_store_state() {
  export FLANNEL_SPOOL_BACKUP="$FLANNEL_SPOOL"
  export FLANNEL_CRUMBS_BACKUP="$FLANNEL_CRUMBS"
  export FLANNEL_STATE_BACKUP="$FLANNEL_STATE"
  export PLAID_PRE_HOOKS_BACKUP="$PLAID_PRE_HOOKS"
  export PLAID_POST_HOOKS_BACKUP="$PLAID_POST_HOOKS"
}