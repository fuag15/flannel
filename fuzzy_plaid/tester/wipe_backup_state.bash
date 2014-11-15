#!/usr/bin/env bash
# used to wipe the state of flannel internals
_flannel_tester_wipe_backup_state() {
  unset FLANNEL_CRUMBS_BACKUP
  unset FLANNEL_STATE_BACKUP
  unset FLANNEL_SPOOL_BACKUP
  unset PLAID_PRE_HOOKS_BACKUP
  unset PLAID_POST_HOOKS_BACKUP 
}