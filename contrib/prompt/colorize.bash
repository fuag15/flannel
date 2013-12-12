#!/usr/bin/env bash
# should clean this up
# this was contributed and then cleaned up a little, still has errors
# most notibly theres a funciton for getting the prompt table depending on user
# but this breaks if the user you ch to doesn't use flannel
_flannel_prompt_colorize() {
  local user_and_host="\[\033[01;32m\]\u\[\033[01;31m\]@"
  local cur_location="\[\033[01;33m\]\w"
  local git_branch_color="\[\033[31m\]"
  local last_color="\[\033[00m\]"
  export PS1="$user_and_host$cur_location $git_branch_color\$(_flannel_prompt_get_git_branch)$(_flannel_prompt_get_tail)$last_color "
}
