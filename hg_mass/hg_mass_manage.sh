#!/bin/bash

# takes a list of dirs then cd's in and runs command
hg_mass_manage() {
  # print help?
  if [[ "$#" == 0 ]]; then
    echo "<command_name> [list of dirs]"
    exit 0
  fi

  # naively set command as first input
  local hgcom="$1"

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