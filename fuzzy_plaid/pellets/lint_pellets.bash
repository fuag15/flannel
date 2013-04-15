#!/usr/bin/env bash
# lint pellets should be colled before anything in a configuration except any calls to lint_pellet
# lint pellets goes through our PLAID_PELLETS and removes and reverse dpendencies
# syntax: `lint_pellets <module> [clear]
# first, check if we got a clear, if not return
# next for each rdepend of us
#   if we dont satisfy it's requirement wiht any existing module in PLAID_SHEEP
#     remove from plaid pellets
#     clear the module!
lint_pellets() {
  # if we aren't clearing, we don't care
  if [[ "${@:(-1)}" != "clear" ]]; then
    return
  fi

  # get the largest relevant sheep
  local sheep; if [[ "$PLAID_SHEEP" == *":$1/"* ]]; then
    # get the sheep
    sheep="${PLAID_SHEEP#*:$1/}"

    # get the version
    sheep="${sheep%%;*}"
  fi

  #echo "found sheep: $sheep"

  local pellet_copy="$PLAID_PELLETS"

  # do we have any pellet deps?
  local current operator version; while [[ "$pellet_copy" == *":${1};"* ]]; do
    # get the first dep from the left and eat the prefix
    current="${pellet_copy#*:$1;}"

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
    pellet_copy="${pellet_copy//:$1;$operator;$version\[$current\]/}"

    # if our sheep isn't null or empty and it sati
    if [[ -n "$sheep" ]]; then
      # if we satisfy it with our sheep then continue our loop
      # first test for equality, are we bounded?
      if [[ "$operator" == *"="* ]]; then
        # are we equal?
        if [[ "$sheep" == "$version" ]];
          continue
        fi
      else # we are bounded, do either top or lower satisfy?
        if [[ "$sheep" == "$operator" || "$sheep" == "$version" ]]; then
          continue
        fi
      fi
      # then relative
      if declare -f _flannel_"$1"_comparator >/dev/null; then
        # if we arent a bounded pellet
        if [[ "$operator" == *"="* ]]; then
          # if its satisfied then
          if _flannel_"$1"_comparator "$sheep" "${operator%=}" "$version"; then
            continue
          fi
        else # we are bounded!
          # if we are greater than our lower
          if _flannel_"$1"_comparator "$sheep" ">" "$operator"; then
            # if we are lower than our greater
            if _flannel_"$1"_comparator "$sheep" "<" "$version"; then
              continue
            fi
          fi
        fi
      else # use default
        # if we arent a bounded pellet
        if [[ "$operator" == *"="* ]]; then
          if _flannel_catch_all_comparator "$sheep" "${operator%=}" "$version"; then
            continue
          fi
        else # we are bounded!
          # if we are greater than our lower
          if _flannel_catch_all_comparator "$sheep" ">" "$operator"; then
            # if we are lower than our greater
            if _flannel_catch_all_comparator "$sheep" "<" "$version"; then
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