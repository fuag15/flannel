#!/usr/bin/env bash
# this funciton is used to store the state of core flannel vars
_flannel_tester_restore_state() {
  export PLAID_SHEEP="$PLAID_SHEEP_BACKUP"
  export PLAID_CRUMBS="$PLAID_CRUMBS_BACKUP"
  export PLAID_SPOOL="$PLAID_SPOOL_BACKUP"
  export PLAID_PRE_HOOKS="$PLAID_PRE_HOOKS_BACKUP"
  export PLAID_POST_HOOKS="$PLAID_POST_HOOKS_BACKUP"
}