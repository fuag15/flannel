#!/usr/bin/env bash
# used to wipe the state of flannel internals
_flannel_tester_wipe_backup_state() {
  unset PLAID_CRUMBS_BACKUP
  unset PLAID_SPOOL_BACKUP
  unset PLAID_SHEEP_BACKUP
}