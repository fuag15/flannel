#!/usr/bin/env bash
# wear our default flannel, its cold in bash
jacket() { 
  # dont leave your place messy or you'll be mad when you get back!
  clean_table

  # wear home config
  [[ -f ~/.flannelrc ]] && wear < ~/.flannelrc

  # if we are setting a profile to stack
  if [[ -n "$1" ]]; then
    # wear our profile
    [[ -f ~/."$1".flannelrc ]] && wear < ~/."$1".flannelrc
  fi

  # wear patches
  [[ -f ./.plaid_patch ]] && wear < ./.plaid_patch
}