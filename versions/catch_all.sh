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
  local current_base="$1" target_base="$3" current_sub target_sub remainder

  # while there are still things to be compared
  while [[ -n "$current_base" || -n "$target_base" ]]; do
    # remove special characters and letters from left and right
    remainder="${current_base%%[[:digit:]]*}"
    current_base="${current_base#$remainder}"
    current_sub="${current_base%%[![:digit:]]*}"

    remainder="${target_base%%[[:digit:]]*}"
    target_base="${target_base#$remainder}"
    target_sub="${target_base%%[![:digit:]]*}"

    # if current_base is null and we want less than, then tru
    if [[ -z "$current_base" ]]; then
      [[ "$2" == "<" ]]; return
    fi

    # if the current_target is null and we want greater than, then return true else false
    if [[ -z "$target_base" ]]; then
      [[ "$2" == ">" ]]; return
    fi

    # remove from base
    current_base="${current_base#$current_sub}"
    target_base="${target_base#$target_sub}"

    # first we check if they are equal, if are we then satisfied!
    if (( current_sub == target_sub )); then
      continue
    else  # if they aren't equal, output comparison
      (( current_sub "$2" target_sub )); return
    fi
  done
}