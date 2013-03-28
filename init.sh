#!/bin/bash

# mill some flannel, or wherever that wondermilk comes from
flannel() {
  # dont include glob literal string for empty glob
  shopt -s nullglob

  # set the option indicator var
  OPTIND=1

  # loop through our named ops
  while getopts "c:" opt; do
    case "$opt" in
      c) local breadcrumbs="$OPTARG"
        ;;
    esac
  done

  # shift off the remaining options and optional --
  shift $((OPTIND-1))

  # set our module and shift it off
  local module="$1"; shift

  # if breadcrumb contains $module'$@' then we are done break
  if [[ $breadcrubs && $breadcrumbs == *"$module'$@'"* ]]; then 
    exit 0
  fi

  # load our modules base files
  for file in ~/flannel/"$module"/*.{sh,bash}; do
    . "$file"
  done

  # now load the modules requirements if it has any
  if [[ -f ~/flannel/"$module"/init.flannel ]]; then
    . ~/flannel/"$module"/init.flannel -c "$breadcrumbs$module'$@'" "$@"
  fi
}

# run our first config
flannel "$@"