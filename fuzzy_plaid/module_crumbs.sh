#!/usr/bin/env bash
# consumes a module messily, leaving some crumbs, succeds if there are already crumbs
# This function is used to break load dependency loops and not load things twice
# it uses an env_var FLANNEL_CRUMBS to manage this that gets whatever params are passed to the modules
# this way we can load a module twice provided we are giving it different options
_flannel_fuzzy_plaid_module_crumbs() {
  # we already ate this say no
  if [[ "$FLANNEL_CRUMBS" == *":${1}"* ]]; then 
    return
  else # new food, nom nom
    export FLANNEL_CRUMBS="${FLANNEL_CRUMBS}:${1}"
  fi
  # we didn't get food already eaten so return 1 to signify this was a new module
  # this is used as an if condition in flannel()
  return 1
}