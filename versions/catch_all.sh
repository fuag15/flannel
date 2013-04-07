#!/usr/bin/env bash
# this is a catch all comparator designed to handle all versions "smartly"
# Syntax: `_flannel_catch_all_comparator <module_base> <comparator{<,>}> <target_version>
# this attempts to smartly match the version by the following criteria
# - while there are still characters left in either side
#   - remove all special characters and letters from the left for each version
#   - remove all special characters and letters from the right for each version
#   - compare result as an integer
#   - if equal
#     - remove from the left what we were matching for both
#     - if the left or right is empty
#       - return left <comparator> right
#   - else
#     - test with comparator and give 0 for true and 1 for false!
_flannel_catch_all_comparator() {
  # get our current and target full base
  local current_base="$1"
  local target_base="$3"

  # set local vars for current manipulation of each base
  local current_sub="$1"
  local target_sub="$3"

  # initialize a remainder var to take of the tail of a string
  local remainder=""

  # while there are still things to be compared
  while [[ -n "$current_base" || -n "$target_base" ]]; do
    # remove special characters and letters from left and right
    current_base="${current_base##*[[:alpha:][:punct:]]}"
    remainder="${current_base##*[[:digit:]]}"
    current_sub="${sub%$remainder}"

    target_base="${target_base##*[[:alpha:][:punct:]]}"
    remainder="${target_base##*[[:digit:]]}"
    target_sub="${sub%$remainder}"

    # if current_base is null and we want less than, then tru
    if [[ -n "$current_base" && "$2" == "<" ]]; then
      return
    else
      return 1
    fi

    # if the current_target is null and we want greater than, then return true else false
    if [[ -n "$current_target" && "$2" == ">" ]]; then
      return
    else
      return 1
    fi

    # remove from base
    current_base="${current_base#current_sub}"
    target_base="${target_base#target_sub}"

    # first we check if they are equal, if are we satisfied or not!
    if (( current_sub == target_sub )); then
      # they were equal, move on to the next part
      continue
    elif (( current_sub "$2" target_sub )); then
      # satisfactory
      return
    else
      # not satisfied!
      return 1
    fi
  done
}