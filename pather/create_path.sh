#!/usr/bin/env bash
create_path() {
  # if we get a clear command undo what this does
  if [[ "${@:(-1)}" == "clear" ]]; then
    remove_from_path "${@:1:(($#-1))}"
    return
  fi

  # if path exists prepend
  if [[ -n "${!1}" ]]; then
    prepend_path "$@"
  else # create the path
    export "$1"="$2"
  fi
}