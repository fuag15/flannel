#!/usr/bin/env bash
prepend_path() {
  # if this is already in our path remove it retrun
  if in_path "$@"; then
    remove_from_path "$@"
  fi

  # if path is empty then just set
  if [[ -z "${!1}" ]]; then
    export "$1"="$2"
  else # prepend
    export "$1"="${2}:${!1}"
  fi
}