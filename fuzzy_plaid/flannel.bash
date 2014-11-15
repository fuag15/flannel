#!/usr/bin/env bash
# mill some flannel, or wherever that wondermilk comes from
#
# # this command is the meat of flannel! Brace Yourself
#
# - first we set null and ext glob so we can use our first path as a glob and ext glob
#   - this is usefull for unloading other modules in vfx that follow a naming pattern
# - we shift off the glob so we dont have to do complicated array arithmatic the rest of the places we pass things for each pass
# - if our crumbing function is prepped we simultaneously test for a crumb and add one, if we already had it we exit gracefully
# - else we load every shell function in a module foldier first, then we load a .flannel init file if it exists
# - we either add or remove to the FLANNEL_STATE to keep track of state
# - then we unset our custom shell ops and run the flannel of hte module if it exists so we dont interfere with any assumptions
# - unset our extensions when we are done
#
# note! this supports passing paramaters to the submodules like clear which is used in the vfx module
flannel() {
  # get our pre hooks done
  local hook; for hook in ${FLANNEL_PRE_HOOKS[@]//:/ }; do
    "$hook" "$@"
  done
  shopt -s nullglob extglob
  # store var so we dont do lots of arithmatic on $@
  local module_glob="$1"; shift 
  # loop through glob matches and run them
  local module; for module in ~/.flannel/$module_glob; do
    # did we already consume this?
    if _flannel_fuzzy_plaid_crumbs "${module#~/.flannel/}'$@'"; then
      # skip this glob match
      continue
    fi

    # keep track of the state
    _flannel_update_state "${module#~/.flannel/}" "$@"

    # keep track of our incoming sheep
    _flannel_spool_add "${module#~/.flannel/}" "$@"
 
    # load our modules base files
    for file in "$module"/*.bash; do
      . "$file"
    done

    shopt -u nullglob extglob
    # now load the modules requirements if it has any
    [[ -f "$module"/init.flannel ]] && . "$module"/init.flannel "$@"
    shopt -s nullglob extglob

    # we loaded it
    _flannel_spool_remove "${module#~/.flannel/}" "$@"
  done
  shopt -u nullglob extglob
  # get our post hooks done
  local hook; for hook in ${FLANNEL_POST_HOOKS[@]//:/ }; do
    "$hook" "$@"
  done
}