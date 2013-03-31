#!/usr/bin/env bash
# load required modules
build_closet() {
  for module in "$@"; do
    flannel "$module"
  done
}