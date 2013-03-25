#!/bin/bash

# takes a list of dirs then cd's in and commits each one each on
hg_mass_commit() {
  # naively set message as first input
  message="$1"

  # shift it on over
  shift
  
  # loop through dirs and commit
  for dir in "$@"; do
    (
      cd "$dir"
      hg commit -m "$message"
    )
  done
}