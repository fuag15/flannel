#!/usr/bin/env bash
# used to wipe the state of flannel internals
_flannel_tester_wipe_state() {
  unset PLAID_CRUMBS
  unset PLAID_SPOOL
  unset PLAID_SHEEP
  unset PLAID_PRE_HOOKS
  unset PLAID_POST_HOOKS
}