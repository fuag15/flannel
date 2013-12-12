#!/usr/bin/env bash
# function to set the tail to a √ symbol if we are a superuser ∫ symbol otherwise, currently breaks if the superuser doesnt have flannel
_flannel_prompt_get_tail(){
  if [[ $UID -ne 0 ]]; then
    printf "\[\033[35m\]∫"
  else 
    printf "\[\033[35m\]√"
  fi
}
