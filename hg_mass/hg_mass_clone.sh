#!/usr/bin/env bash

# takes username and host as arguments then a list of repo names and clones them
hg_mass_clone() {
  # print help?
  if [[ "$#" == 0 ]]; then
    echo "-u <name> -h <host> [list of clonins]"
    exit 0
  fi
  
  # loop through our named ops
  OPTIND=1; while getopts "n:h:" opt; do
    case "$opt" in
      n) name="$OPTARG" ;;
      h) host="$OPTARG" ;;
    esac
  done; shift $((OPTIND-1))

  # get our hg path
  local hg_path="ssh://$name@$host/"
  
  # one loop to clone them all
  for repo in "$@"; do
    hg clone "$hg_path$repo"
  done
}