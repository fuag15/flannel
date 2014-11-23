#!/usr/bin/env bash
# usefull for keeping track of path states
# this removes the 2nd argument (which can be a glob) in the path named by the first argument\
# note you shouldn't use the glob unless you know what your doing, it will break auto reversal!
# if it recieves clear as the last argument it undoes whatever change the command would have done
# note, do not pass path variables here, just path names
# - if we get passed clear we want to undo a change, undo it
# - if its the only thing in the path remove it!
# - sepecially handle middle end and beginnig casses (prevents removing parent parts of child paths)
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

  # clear from beggining
  local path_contents="${!1#${2}:}"

  # clear from middle of path
  path_contents="${path_contents//:${2}:/:}"

  # clear from end of path
  export "$1"="${path_contents%:$2}"
}
