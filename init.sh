#!/usr/bin/env bash

# to install put this where your bash is sourced
# [[ -f ~/.flannel/init.sh ]] && . ~/.flannel/init.sh fuzzy_plaid

# mill some flannel, or wherever that wondermilk comes from
flannel() {
  shopt -s nullglob extglob
  local module_glob="$1"; shift 
  for module in ~/.flannel/$module_glob; do
    # did we already consume this?
    if declare -f _flannel_fuzzy_plaid_module_crumbs >/dev/null && _flannel_fuzzy_plaid_module_crumbs "${module#~/.flannel}'$@'"; then
      return 0
    fi
 
    # load our modules base files without nullglob returning literal string
    for file in "$module"/*.{sh,bash}; do
      . "$file"
    done

    shopt -u nullglob extglob
    # now load the modules requirements if it has any
    [[ -f "$module"/init.flannel ]] && . "$module"/init.flannel "$@"
    shopt -s nullglob extglob
  done
  shopt -u nullglob extglob
}

# run our first config
flannel "$@"