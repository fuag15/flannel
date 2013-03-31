#!/bin/bash
# wear our default flannel, its cold in bash
jacket() { 
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