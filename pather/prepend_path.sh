#!/usr/bin/env bash
prepend_path() {
  # if we get a clear command undo what this does
  if [[ "${@:(-1)}" == "clear" ]]; then
    remove_from_path "${@:1:$#}"
    return
  fi

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