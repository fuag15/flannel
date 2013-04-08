#!/usr/bin/env bash
# sometimes your closet gets messy
# this is a helper function that removes all versions of a module which are present
# if it recieves a version it removes all versions but the specified version
# syntax: `clean_closet <module_base> [version] [clean]`
# on a clean we ignore
# for each thing in the module that isn't requested, if its in our closet, clear it
clean_closet() {
  # disable null globs returning literals, and enable glob extensions
  shopt -s extglob
  shopt -s nullglob
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  # each module that matches our params
  for module in ~/.flannel/"$1"/!("$2"|*.flannel|*.md|*.sh|*.bash); do
    # if this is in our path
    if [[ "$PLAID_SPOOL" == *"${module#~/.flannel/}"* ]]; then
      # remove it
      flannel "${module#~/.flannel/}" clear
    fi
  done
  # restore state
  shopt -u extglob
  shopt -u nullglob
}