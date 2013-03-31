#!/usr/bin/env bash
remove_from_path() {
  # if we get a clear command undo what this does
  if [[ "${@:(-1)}" == "clear" ]]; then
    append_path "${@:1:(($#-1))}"
    return
  fi

  # could be the only thing in path
  if [[ "${!1}" == "$2" ]]; then
    unset "$1"
    return
  fi

  # clear from middle / beginning of path
  local path_contents="${!1//${2}:/}"

  # clear from end of path
  export "$1"="${path_contents%:${2}}"
}