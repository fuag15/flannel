# wear our default flannel, its cold in bash
jacket() { 
  # wear home config
  [[ -f ~/.flannelrc ]] && wear < ~/.flannelrc

  # wear patches
  [[ -f ./.plaid_patch ]] && wear < ./.plaid_patch
}