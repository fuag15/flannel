#!/usr/bin/env bash
# to install put this where your bash is sourced
# [[ -f ~/.flannel/init.sh ]] && . ~/.flannel/init.bash

shopt -s nullglob
# load our main module and flannel it
for file in ~/.flannel/fuzzy_plaid/*.bash; do
  . "$file"
done
shopt -u nullglob

# load it!
vest "fuzzy_plaid"