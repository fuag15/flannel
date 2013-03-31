#!/bin/bash
## initial code contributed by @odgrim
completion_for_vest () {
  shopt -s nullglob
  COMPREPLY=(~/.flannel/"${COMP_WORDS[COMP_CWORD]}"*/)
  COMPREPLY=("${COMPREPLY[@]#~/.flannel/}")
  COMPREPLY=("${COMPREPLY[@]%/}")
  shopt -u nullglob
}