#!/usr/bin/env bash
# this funciton is used to store the state of core flannel vars
_flannel_core_tester_store_state() {
  export FLANNEL_SPOOL_BACKUP="$FLANNEL_SPOOL"
  export FLANNEL_REVERSE_DEPENDENCIES_BACKUP="$FLANNEL_REVERSE_DEPENDENCIES"
  export FLANNEL_STATE_BACKUP="$FLANNEL_STATE"
  export FLANNEL_PRE_HOOKS_BACKUP="$FLANNEL_PRE_HOOKS"
  export FLANNEL_POST_HOOKS_BACKUP="$FLANNEL_POST_HOOKS"
}
