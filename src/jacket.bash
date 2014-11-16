#!/usr/bin/env bash
# wear our default flannel, its cold in bash
# - cleans breadcrumbs out of var from last run
# - wear's default home config if it's there
# - wear's any specified named home default config on top of that
# - wear's any local plaid_patces
jacket() { 
  _flannel_clear_revdeps

  # clear our old sheep
  _flannel_clear_spool

  # wear home default config if exists
  [[ -f ~/.flannelrc ]] && _flannel_load_module_config < ~/.flannelrc

  # if we passed a named profile to load
  if [[ -n "$1" ]]; then
    [[ -f ~/."$1".flannelrc ]] && _flannel_load_module_config < ~/."$1".flannelrc
  fi

  # wear patches
  [[ -f ./.plaid_patch ]] && _flannel_load_module_config < ./.plaid_patch
}