#!/usr/bin/env bash
# wear our default flannel, its cold in bash
jacket() { 
  # dont leave your place messy or you'll be mad when you get back!
  _flannel_fuzzy_plaid_clean_table

  # wear home config
  [[ -f ~/.flannelrc ]] && _flannel_fuzzy_plaid_wear < ~/.flannelrc

  # if we are setting a profile to stack
  if [[ -n "$1" ]]; then
    # wear our profile
    [[ -f ~/."$1".flannelrc ]] && _flannel_fuzzy_plaid_wear < ~/."$1".flannelrc
  fi

  # wear patches
  [[ -f ./.plaid_patch ]] && _flannel_fuzzy_plaid_wear < ./.plaid_patch
}