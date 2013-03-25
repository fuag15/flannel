#!/bin/bash

# list of modules to load
modules=(git_quick hg_mass swap)

# just load all ok?
for module in "${modules[@]}"; do
  # all files in the modules folder
  for file in $(ls ~/bashrc/"$module"/*); do
    source "$file"
  done
done