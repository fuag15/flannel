#!/usr/bin/env bash
_flannel_prompt_get_tail(){
  if [[ $UID -ne 0 ]]; then
    printf "\033[35m∫"
  else 
    printf "\033[35m√"
  fi
}