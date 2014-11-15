#!/usr/bin/env bash
# consumes a module messily, leaving some crumbs, succeds if there are already crumbs
# This function is used to break load dependency loops and not load things twice
# it uses an env_var FLANNEL_CRUMBS to manage this that gets whatever params are passed to the modules
# this way we can load a module twice provided we are giving it different options
_flannel_fuzzy_plaid_crumbs() {
  # we didn't eat this
  if [[ "$FLANNEL_CRUMBS" != *":${1}"* ]]; then 
    export FLANNEL_CRUMBS="${FLANNEL_CRUMBS}:${1}"; return 1
  fi
}