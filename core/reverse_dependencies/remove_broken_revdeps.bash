#!/usr/bin/env bash
# lint pellets should be colled before anything in a configuration except any calls to fix_reverse_dependencies
# lint pellets goes through our FLANNEL_REVERSE_DEPENDENCIES and removes and reverse dpendencies
# syntax: `remove_broken_reverse_dependencies <module> [clear]
# first, check if we got a clear, if not return
# next for each rdepend of us
#   if we dont satisfy it's requirement wiht any existing module in FLANNEL_SPOOL
#     remove from plaid pellets
#     clear the module!
remove_broken_reverse_dependencies() {
  # if we aren't clearing, we don't care
  if [[ "${@:(-1)}" != "clear" ]]; then
    return
  fi

  # get the most recent item added to the spool
  local current_module; if [[ "$FLANNEL_SPOOL" == *":$1/"* ]]; then
    # get the current_module
    current_module="${FLANNEL_SPOOL#*:$1/}"

    # get the version
    current_module="${current_module%%;*}"
  fi

  #echo "found current_module: $current_module"

  local revdeps_copy="$FLANNEL_REVERSE_DEPENDENCIES"

  # do we have any pellet deps?
  local current operator version; while [[ "$revdeps_copy" == *":${1};"* ]]; do
    # get the first dep from the left and eat the prefix
    current="${revdeps_copy#*:$1;}"

    # get the operator from the left
    operator="${current%%;*}"

    # eat the operator
    current="${current#*;}"

    # get the version
    version="${current%%[*}"

    # eat off the version
    current="${current#*[}"

    # get just the current abslute module path
    current="${current%%]*}"

    # remove it from our pellet copy
    revdeps_copy="${revdeps_copy//:$1;$operator;$version\[$current\]/}"

    # if our current_module isn't null or empty and it sati
    if [[ -n "$current_module" ]]; then
      # if we satisfy it with our current_module then continue our loop
      # first test for equality, are we bounded?
      if [[ "$operator" == *"="* ]]; then
        # are we equal?
        if [[ "$current_module" == "$version" ]]; then
          continue
        fi
      else # we are bounded, do either top or lower satisfy?
        if [[ "$current_module" == "$operator" || "$current_module" == "$version" ]]; then
          continue
        fi
      fi
      # then relative
      if declare -f _flannel_core_"$1"_comparator >/dev/null; then
        # if we arent a bounded pellet
        if [[ "$operator" == *"="* ]]; then
          # if its satisfied then
          if _flannel_core_"$1"_comparator "$current_module" "${operator%=}" "$version"; then
            continue
          fi
        else # we are bounded!
          # if we are greater than our lower
          if _flannel_core_"$1"_comparator "$current_module" ">" "$operator"; then
            # if we are lower than our greater
            if _flannel_core_"$1"_comparator "$current_module" "<" "$version"; then
              continue
            fi
          fi
        fi
      else # use default
        # if we arent a bounded pellet
        if [[ "$operator" == *"="* ]]; then
          if _flannel_core_catch_all_comparator "$current_module" "${operator%=}" "$version"; then
            continue
          fi
        else # we are bounded!
          # if we are greater than our lower
          if _flannel_core_catch_all_comparator "$current_module" ">" "$operator"; then
            # if we are lower than our greater
            if _flannel_core_catch_all_comparator "$current_module" "<" "$version"; then
              continue
            fi
          fi
        fi
      fi
    fi

    # if we got here then it needs to be removed, remove it
    flannel "$current" clear
  done
}