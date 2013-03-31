#!/bin/bash
create_path() {
  # if path exists prepend
  if [[ -n "${!1}" ]]; then
    prepend_path "$@"
  else # create the path
    export "$1"="$2"
  fi
}