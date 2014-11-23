#!/usr/bin/env bash
# sometimes your closet gets messy
# this is a helper function that removes all versions of a module which are present
# if it recieves a version it removes all versions but the specified version
# syntax: `clear_modules <module_base> [version] [clean]`
# on a clean we ignore
# for each thing in the module that isn't requested, if its in our closet, clear it
clear_modules() {
  # disable null globs returning literals, and enable glob extensions  
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  shopt -s extglob nullglob
  # each module that matches our params
  local module; for module in ~/.flannel/"$1"/!("$2"|*.flannel|*.md|*.bash); do
    # if this is in our path
    if [[ "$FLANNEL_STATE" == *"${module#~/.flannel/}"* ]]; then
      # remove it
      flannel "${module#~/.flannel/}" clear
    fi
  done
  # restore state
  shopt -u extglob nullglob
}
