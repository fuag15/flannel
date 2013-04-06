#!/usr/bin/env bash
# this is a catch all comparator designed to handle all versions "smartly"
# Syntax: `_flannel_catch_all_comparator <module_base> <comparator{<,>}> <target_version>
# this attempts to smartly match the version by the following criteria
# - remove all special characters and letters from the left for each version
# - remove all special characters and letters from the right for each version
# - compare result as an integer
# - if equal
#   - remove from the left what we were matching for both
#   - if the left or right is empty
#     - return left <comparator> right
# - else
#   - test with comparator and give 0 for true and 1 for false!
_flannel_catch_all_comparator() {
  
}