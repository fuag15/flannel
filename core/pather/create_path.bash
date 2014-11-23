#!/usr/bin/env bash
# usefull for keeping track of path states
# this creates a path named by the first argument with the value of the second argument
# if it recieves clear as the last argument it undoes whatever change the command would have done
# note, do not pass path variables here, just path names
# - if we get passed clear we want to undo a change, undo it
# - if our path already exists, prepend it, if its already in path it will be first
# - if our path is empty set it
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
