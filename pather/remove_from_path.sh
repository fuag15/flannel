#!/bin/bash
remove_from_path() {
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