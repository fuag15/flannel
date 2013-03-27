# wear our default flannel, its cold in bash
jacket() { 
  shopt -s nullglob

  # load home config
  for config in ~/.flannelrc; do
    wear < "$config"
  done
  
  # load local config
  for plad_patch in ~/.*.plad_patch; do
    wear < "$plad_patch"
  done
}