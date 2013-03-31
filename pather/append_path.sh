#!/bin/bash
append_path() {
  # if this is already in our path just retrun
  if in_path "$@"; then
    return
  fi

  # if path is empty then just set
  if [[ -z "$!1" ]]; then
    export "$1"="$2"
  else
    export "$1"="${!1}:${2}"
  fi
}