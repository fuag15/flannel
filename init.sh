#!/bin/bash

# to load put this in wherever your shell is sourced (.bashrc, .bash_profile)
# [[ -s ~/flannel/init.sh ]] && . ~/flannel/init.sh <modules to load by name>
# this expects to be in flannel in your home directory, it will break otherwise
# you can pass vars into this

# dont return literals for empty globs
shopt -s nullglob

# alias us!
alias flannel='~/flannel/init.sh'

# load modules
for module in "$@"; do
  # load module files first
  for file in ~/flannel/"$module"/*.{sh,bash}; do
    echo "$file"
  done

  # now load the modules requirements if it has any
  for flannel in ~/flannel/"$module"/*.flannel; do
    echo "$flannel"
  done
done