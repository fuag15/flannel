#!/usr/bin/env bash
# dont leave a mess for the next generation man
# This function clears our breadcrumb type env var between each load request
_flannel_core_clear_reverse_dependencies() {
  # if we left crumbs, clean them up!
  unset FLANNEL_REVERSE_DEPENDENCIES
}