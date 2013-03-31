#!/bin/bash

#just some initial aliases i like
alias gqp=git_quick_publish
alias hgmc=hg_mass_clone
alias hgmcom=hg_mass_commit
alias hgmm=hg_mass_manage
alias swapid=swap_id
alias gc='git commit -am'
alias ga='git add .'
alias gac='ga && gc'
alias gp='git push'
alias gpo='git push origin'
alias gpoc='git push origin $(git rev-parse --abbrev-ref HEAD 2> /dev/null)'
alias gffs='git flow feature start'
alias gffp='git flow feature publish'
alias gfff='git flow feature finish'