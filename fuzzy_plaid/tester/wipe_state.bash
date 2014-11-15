#!/usr/bin/env bash
# used to wipe the state of flannel internals
_flannel_tester_wipe_state() {
  unset FLANNEL_CRUMBS
  unset FLANNEL_STATE
  unset FLANNEL_SPOOL
  unset FLANNEL_PRE_HOOKS
  unset FLANNEL_POST_HOOKS
}