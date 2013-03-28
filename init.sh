#!/bin/bash

# to install put this where your bash is sourced
# [[ -f ~/flannel/init.sh ]] && . ~/flannel/init.sh fuzzy_plaid

# mill some flannel, or wherever that wondermilk comes from
flannel() {
  # dont return our literal glob expression on null globs
  shopt -s nullglob

  # take in any breadcrumbs and module name
  OPTIND=1
  while getopts "c:" opt; do  # loop through our bread crumbs
    case "$opt" in
      c) local breadcrumbs="$OPTARG"
        ;;
    esac
  done
  
  # shift off parsed options
  shift $((OPTIND-1))

  # set our module and shift it off
  local module="$1"; shift 

  # if breadcrumb contains $module'$@' then we have already loaded it, break
  if [[ -n $breadcrubs && $breadcrumbs == *"$module'$@'"* ]]; then 
    exit 0
  fi

  # load our modules base files
  for file in ~/flannel/"$module"/*.{sh,bash}; do
    . "$file"
  done

  # now load the modules requirements if it has any
  [[ -f ~/flannel/"$module"/init.flannel ]] && . ~/flannel/"$module"/init.flannel -c "$breadcrumbs$module'$@'" "$@"
}

# run our first config
flannel "$@"