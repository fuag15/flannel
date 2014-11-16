#!/usr/bin/env bash
# this funciton is used to store the state of core flannel vars
_flannel_tester_restore_state() {
  export FLANNEL_SPOOL="$FLANNEL_SPOOL_BACKUP"
  export FLANNEL_REVDEPS="$FLANNEL_REVDEPS_BACKUP"
  export FLANNEL_STATE="$FLANNEL_STATE_BACKUP"
  export FLANNEL_PRE_HOOKS="$FLANNEL_PRE_HOOKS_BACKUP"
  export FLANNEL_POST_HOOKS="$FLANNEL_POST_HOOKS_BACKUP"
}