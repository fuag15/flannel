# wear our default flannel, its cold in bash
jacket() { 
  # wear home config
  [[ -f ~/.flannelrc ]] && wear < ~/.flannelrc

  # wear patches
  [[ -f ./.plad_patch ]] && wear < ./.plad_patch
}