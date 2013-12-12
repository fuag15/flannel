#!/usr/bin/env bash
# returns the git branch you are currently on, prints it in parenthesis with an extra space at the end to keep prompt pretty
# else it prints nothin
_flannel_prompt_get_git_branch() {
  local branchname=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n "$branchname" ]]; then
    echo "($branchname) "
  fi
}
