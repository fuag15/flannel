#!/usr/bin/env bash
# initial code contributed by @odgrim
# this handles bash completions for vest tasks
# - gets all matching words in .flannel
# - removes the trailing / 
# - removed the preceeding ~/.flannel
# If your cool and using bash >= 4 it will correct for submodules too
_flannel_core_completion_for_vest () {
  if [[ "${BASH_VERSION%%.*}" < 4 ]]; then # we are on bash less than 4, sad times
    shopt -s nullglob
    COMPREPLY=(~/.flannel/"${COMP_WORDS[COMP_CWORD]}"*/)
    COMPREPLY=("${COMPREPLY[@]%/}")
    COMPREPLY=("${COMPREPLY[@]#~/.flannel/}")
    shopt -u nullglob
  else # we are on bash 4 yayy its globstar time
    shopt -s nullglob globstar
    COMPREPLY=(~/.flannel/**/"${COMP_WORDS[COMP_CWORD]}"*/)
    COMPREPLY=("${COMPREPLY[@]#~/.flannel/}")
    COMPREPLY=("${COMPREPLY[@]%/}")
    shopt -u nullglob globstar
  fi
}