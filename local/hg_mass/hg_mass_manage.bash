#!/usr/bin/env bash
# takes a list of dirs then cd's in and runs teh firts argument as an hg command
hg_mass_manage() {
  # print help?
  if [[ "$#" == 0 ]]; then
    echo "<command_name> [list of dirs]"
    exit 0
  fi

  # loop through dirs and run supplied command
  for dir in "${@:2:$#}"; do
    (
      cd "$dir"
      hg "$1"
    )
  done
}