#!/bin/bash

# to load put this in wherever your shell is sourced (.bashrc, .bash_profile)
# [[ -s "$HOME/bashrc/boone.sh" ]] && source "$HOME/bashrc/boone.sh"
# this expects to be in bashrc in your home directory, it will break otherwise

# list of modules to load
modules=(git_quick hg_mass swap aliases)

# just load all ok?
for module in "${modules[@]}"; do
  # all files in the modules folder
  for file in $(ls ~/bashrc/"$module"/*); do
    source "$file"
  done
done