#!/usr/bin/env bash
# this command lints the pellets for dependencies of the given module
# if the dependency maches the given rdepend it provides a substitution! :)
# syntax: `lint_pellet <module> <rdepend> <operator> <version> [clear]
# if we are not clearing, who cares, return
# if the module rdepend pair is nour path
#   check the module operator against any sheep
#   if a sheep satisfies it then
#     if the version satisfies our operator
#       return
#   else
#     flannel its substitution
lint_pellet() {
  # if we are clearing, we don't care
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi
  
  # if its in the pellets
  if [[ "$PLAID_PELLETS" == *":$1[$2]"* ]]; then
    # clear it from the path
    export PLAID_PELLETS="${PLAID_PELLETS//:$1\[$2\]/}"

    # clear the rdepend
    flannel "$2" clear

    # set the substitution
    flannel "$3"
  fi
}