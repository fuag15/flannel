#!/usr/bin/env bash
# consumes a module messily, leaving some crumbs, succeds if there are already crumbs
# This function is used to break load dependency loops and not load things twice
# it uses an env_var FLANNEL_REVERSE_DEPENDENCIES to manage this that gets whatever params are passed to the modules
# this way we can load a module twice provided we are giving it different options
_flannel_core_track_reverse_dependencies() {
  # we didn't eat this
  if [[ "$FLANNEL_REVERSE_DEPENDENCIES" != *":${1}"* ]]; then 
    export FLANNEL_REVERSE_DEPENDENCIES="${FLANNEL_REVERSE_DEPENDENCIES}:${1}";
    return 1
  fi
}
