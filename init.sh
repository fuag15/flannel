#!/bin/bash

# mill some flannel, or wherever that wondermilk comes from
flannel() {
  shopt -s nullglob

  # load modules
  for module in "$@"; do
    # load module files first
    for file in ~/flannel/"$module"/*.{sh,bash}; do
      . "$file"
    done

    # now load the modules requirements if it has any
    for flannel in ~/flannel/"$module"/*.flannel; do
      . "$flannel"
    done
  done
}

# run our first config
flannel "$@"