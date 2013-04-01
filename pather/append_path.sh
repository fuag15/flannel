#!/usr/bin/env bash
# usefull for keeping track of path states
# this appends the 2nd argument to the path named by the first argument
# if it recieves clear as the last argument it undoes whatever change the command would have done
# note, do not pass path variables here, just path names
# - if we get passed clear we want to undo a change, undo it
# - if its already in our path, remove it and re append
# - if our path is empty set it
# - else append it!
append_path() {
  # if we get a clear command undo what this does
  if [[ "${@:(-1)}" == "clear" ]]; then
    remove_from_path "${@:1:(($#-1))}"
    return
  fi

  # if this is already in our path remove it
  if in_path "$@"; then
    remove_from_path "$@"
  fi

  # if path is empty then just set
  if [[ -z "${!1}" ]]; then
    export "$1"="$2"
  else # append it
    export "$1"="${!1}:${2}"
  fi
}