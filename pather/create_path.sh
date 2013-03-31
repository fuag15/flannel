#!/bin/bash
create_path() {
  # if path exists prepend
  if [[ -z "$!1" ]]; then
    prepend_path "$@"
  else # create the path
    export "$1"="$2"
  fi
}