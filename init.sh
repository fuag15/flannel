#!/usr/bin/env bash
# to install put this where your bash is sourced
# [[ -f ~/.flannel/init.sh ]] && . ~/.flannel/init.sh fuzzy_plaid
#
# mill some flannel, or wherever that wondermilk comes from
#
# # this command is the meat of flannel! Brace Yourself
#
# - first we set null and ext glob so we can use our first path as a glob and ext glob
#   - this is usefull for unloading other modules in vfx that follow a naming pattern
# - we shift off the glob so we dont have to do complicated array arithmatic the rest of the places we pass things for each pass
# - if our crumbing function is prepped we simultaneously test for a crumb and add one, if we already had it we exit gracefully
# - else we load every shell function in a module foldier first, then we load a .flannel init file if it exists
# - we either add or remove to the PLAID_SPOOL to keep track of state
# - then we unset our custom shell ops and run the flannel of hte module if it exists so we dont interfere with any assumptions
# - unset our extensions when we are done
#
# note! this supports passing paramaters to the submodules like clear which is used in the vfx module
flannel() {
  # set some custom ops for globing
  shopt -s nullglob extglob
  # store var so we dont do lots of arithmatic on $@
  local module_glob="$1"; shift 
  # loop through glob matches and run them
  for module in ~/.flannel/$module_glob; do
    # did we already consume this?
    if declare -f _flannel_fuzzy_plaid_module_crumbs >/dev/null && _flannel_fuzzy_plaid_module_crumbs "${module#~/.flannel}'$@'"; then
      # skip this glob match
      continue
    fi
 
    # load our modules base files
    for file in "$module"/*.{sh,bash}; do
      . "$file"
    done

    # unset our shell opts so modules inits have a clean env
    shopt -u nullglob extglob

    # now load the modules requirements if it has any
    [[ -f "$module"/init.flannel ]] && . "$module"/init.flannel "$@"

    # keep track of the state
    if declare -f _flannel_fuzzy_plaid_spool_plaid >/dev/null; then
      _flannel_fuzzy_plaid_spool_plaid "${module#~/.flannel}" "$@"
    fi

    # reset our shell opt for next run
    shopt -s nullglob extglob
  done
  # make sure our shell opt is unset
  shopt -u nullglob extglob
}

# run our first config
flannel "$@"