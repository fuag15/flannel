#!/usr/bin/env bash
# used to wipe the state of flannel internals
_flannel_core_tester_wipe_state() {
  unset FLANNEL_REVERSE_DEPENDENCIES
  unset FLANNEL_STATE
  unset FLANNEL_SPOOL
  unset FLANNEL_PRE_HOOKS
  unset FLANNEL_POST_HOOKS
}
