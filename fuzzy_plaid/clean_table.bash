#!/usr/bin/env bash
# dont leave a mess for the next generation man
# This function clears our breadcrumb type env var between each load request
_flannel_core_clear_crumbs() {
  # if we left crumbs, clean them up!
  unset FLANNEL_CRUMBS
}