#!/bin/bash

# to load put this in wherever your shell is sourced (.bashrc, .bash_profile)
# [[ -s ~/bashrc/boone.sh ]] && . ~/bashrc/boone.sh <modules to load by name>
# this expects to be in bashrc in your home directory, it will break otherwise
# you can pass vars into this

# list of modules to load only do this is we got not commands
if [[ "$#" == 0 ]]; then
  modules=(git_quick hg_mass swap aliases)
else
  modules="$@"
fi

# just load all ok?
for module in "${modules[@]}"; do
  # all files in the modules folder
  for file in $(ls ~/bashrc/"$module"/*); do
    . "$file"
  done
done