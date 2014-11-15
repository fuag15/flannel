#!/usr/bin/env bash
# this funciton is used to store the state of core flannel vars
_flannel_tester_restore_state() {
  export FLANNEL_SPOOL="$FLANNEL_SPOOL_BACKUP"
  export FLANNEL_CRUMBS="$FLANNEL_CRUMBS_BACKUP"
  export FLANNEL_STATE="$FLANNEL_STATE_BACKUP"
  export PLAID_PRE_HOOKS="$PLAID_PRE_HOOKS_BACKUP"
  export PLAID_POST_HOOKS="$PLAID_POST_HOOKS_BACKUP"
}