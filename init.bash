#!/usr/bin/env bash
# to install put this where your bash is sourced
# [[ -f ~/.flannel/init.sh ]] && . ~/.flannel/init.bash
export FLANNEL_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

shopt -s nullglob extglob
# load our main module and flannel it
for file in $FLANNEL_HOME/core/*.bash; do
  . "$file"
done
shopt -u nullglob extglob

# load it!
vest "core"
