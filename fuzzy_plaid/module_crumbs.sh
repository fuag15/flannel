#!/usr/bin/env bash

# consumes a module succeds if there are crumbs
module_crumbs() {
  if [[ -z "$FLANNEL_CRUMBS" ]]; then # this is our first chomp set it
    export FLANNEL_CRUMBS="${1}:"
  elif [[ "$FLANNEL_CRUMBS" == *"${1}:"* ]]; then # we already ate this say no
    return
  else # new food, nom nom
    export FLANNEL_CRUMBS="${FLANNEL_CRUMBS}${1}:"
  fi
  return 1
}