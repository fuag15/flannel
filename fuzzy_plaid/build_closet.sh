#!/usr/bin/env bash
# this is a helper funciton that takes a simple list of modules and loads them in order
# this is usefull for module requirements
build_closet() {
  for module in "$@"; do
    flannel "$module"
  done
}