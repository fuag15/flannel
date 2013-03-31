#!/bin/bash
replace_in_path() {
  # could be a blank path
  if [[ -z "${!1}" ]]; then
    create_path "$1" "$3"
  fi

  # could be the only thing in path
  if [[ "${!1}" == "$2" ]]; then
    export "$1"="$3"
    return
  fi

  # replace from beggining or middle
  local modified_path="${!1//${2}:/${3}:}"

  # replace from end
  export "$1"="${modified_path/%:$2/:$3}"
}