#!/bin/bash

# to install put this where your bash is sourced
# [[ -f ~/flannel/init.sh ]] && . ~/flannel/init.sh fuzzy_plaid

# mill some flannel, or wherever that wondermilk comes from
flannel() {
  local module="$1"; shift 

  # did we already consume this?
  if declare -f module_crumbs >/dev/null && module_crumbs "$module'$@'"; then
    return 0
  fi

  # load our modules base files without nullglob returning literal string
  shopt -s nullglob
  for file in ~/flannel/"$module"/*.{sh,bash}; do
    . "$file"
  done
  shopt -u nullglob

  # now load the modules requirements if it has any
  [[ -f ~/flannel/"$module"/init.flannel ]] && . ~/flannel/"$module"/init.flannel -c "$breadcrumbs$module'$@'" "$@"
}

# run our first config
flannel "$@"