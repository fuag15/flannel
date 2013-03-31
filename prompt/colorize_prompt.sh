#!/bin/bash
# should clean this up
colorize_prompt() {
  local user_and_host="\[\033[01;32m\]\u\[\033[01;31m\]@"
  local cur_location="\[\033[01;33m\]\w"
  local git_branch_color="\[\033[31m\]"
  local last_color="\[\033[00m\]"
  export PS1="$user_and_host$cur_location $git_branch_color\$(get_git_branch)$(prompt_get_tail)$last_color "
}