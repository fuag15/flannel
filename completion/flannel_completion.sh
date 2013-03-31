#!/bin/bash
## initial code contributed by @odgrim
__flannel_completion () {
  shopt -s nullglob
  case "${COMP_WORDS[COMP_CWORD-1]}" in
    vest)
      COMPREPLY=(~/.flannel/"${COMP_WORDS[COMP_CWORD]}"*/)
      COMPREPLY=("${COMPREPLY[@]#~/.flannel}")
      COMPREPLY=("${COMPREPLY[@]%/}")
    ;;
  esac
  shopt -u nullglob
}