#!/usr/bin/env bash
# to install put this where your bash is sourced
# [[ -f ~/.flannel/init.sh ]] && . ~/.flannel/init.bash

shopt -s nullglob extglob
# load our main module and flannel it
for file in ~/.flannel/src/*.bash; do
  . "$file"
done
shopt -u nullglob extglob

# load it!
vest "src"
