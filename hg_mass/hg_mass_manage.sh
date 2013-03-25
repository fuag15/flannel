#!/bin/bash

# takes a list of dirs then cd's in and runs command
hg_mass_manage() {
  # naively set command as first input
  hgcom="$1"

  # shift it on over
  shift;

  # loop through dirs and merge
  for dir in "$@"; do
    (
      cd "$dir"
      hg "$hgcom"
    )
  done
}