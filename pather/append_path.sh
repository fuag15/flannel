#!/usr/bin/env bash
append_path() {
  # if this is already in our path remove it
  if in_path "$@"; then
    remove_from_path "$@"
  fi

  # if path is empty then just set
  if [[ -z "${!1}" ]]; then
    export "$1"="$2"
  else
    export "$1"="${!1}:${2}"
  fi
}