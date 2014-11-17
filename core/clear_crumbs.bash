#!/usr/bin/env bash
# dont leave a mess for the next generation man
# This function clears our breadcrumb type env var between each load request
_flannel_clear_revdeps() {
  # if we left crumbs, clean them up!
  unset FLANNEL_REVDEPS
}