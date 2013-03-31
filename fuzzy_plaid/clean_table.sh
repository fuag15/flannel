#!/bin/bash
# dont leave a mess for the next generation man
clean_table() {
  # if we left crumbs, clean them up!
  if [[ -n "$FLANNEL_CRUMBS" ]]; then
    unset FLANNEL_CRUMBS
  fi
}