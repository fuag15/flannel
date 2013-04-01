#!/usr/bin/env bash
_flannel_prompt_get_git_branch() {
  local branchname=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n "$branchname" ]]; then
    echo "($branchname) "
  fi
}