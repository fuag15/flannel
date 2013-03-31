#!/bin/bash
# split up but not usable yet note \$(permission_aware_tail) will eval each time
# but is broken because root has no ~/.flannel, see issue #5 for details
colorize_prompt() {
    local user_and_host="\[\033[01;32m\]\u\[\033[01;31m\]@"
    local cur_location="\[\033[01;33m\]\w"
    local git_branch_color="\[\033[31m\]"
    local git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local last_color="\[\033[00m\]"
    export PS1="$user_and_host$cur_location $git_branch_color$git_branch\$(permission_aware_tail)$last_color "
}