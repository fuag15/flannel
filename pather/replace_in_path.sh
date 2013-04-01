#!/usr/bin/env bash
# usefull for keeping track of path states
# this replaces any occurances the 2nd argument (which can be a glob) in the path named by the first argument by the third argument
# e.g. remove_from_path PYTHONPATH /usr/lib/python2.? /usr/lib/python2.6
# note you shouldn't use the glob unless you know what your doing, it will break auto reversal!
# if it recieves clear as the last argument it undoes whatever change the command would have done
# note, do not pass path variables here, just path names
# - if we get passed clear we want to undo a change, undo it
# - if its a blank path create it
# - if its the only thing in our path then replace it
# - else replace from middle and end specially (this avoids replacing parents of subpaths!)
replace_in_path() {
  # if we get a clear command undo what this does
  if [[ "${@:(-1)}" == "clear" ]]; then
    replace_in_path "$1" "$3" "$2"
    return
  fi

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