#!/usr/bin/env bash
# this command lints the pellets for dependencies of the given module
# if the dependency maches the given rdepend it provides a substitution! :)
# syntax: `fix_reverse_dependencies <module> <rdepend> <lower bound> <upper bound> [default clear]
# if we are clearing, who cares, return
# if the module rdepend pair is in our path
#   get info out of it
#   if version satisfies operator
#     return
#   else
#     remove from path
#     flannel substitution
fix_reverse_dependencies_within_bounds() {
  # if we are clearing, we don't care
  if [[ "${@:(-1)}" == "clear" ]]; then
    return
  fi

  # copy for our own manipulation
  local revdeps_copy="$FLANNEL_REVERSE_DEPENDENCIES"
  
  # if its in the pellets
  local current_rdepend_version; while [[ "$revdeps_copy" == *":$1;"* ]]; do
    # get the first dep from the left and eat the prefix
    local current_rdepend_version="${revdeps_copy#*:$1;}"

    # eat extraneous right hand side
    current_rdepend_version="${current_rdepend_version%%]*}"

    # eat it and continue
    revdeps_copy="${revdeps_copy//:$1;$current_rdepend_version\]/}"

    # if it is not for the rdepend we are lookin for, continue
    if [[ "$current_rdepend_version" != *"$2"* ]]; then
      continue
    fi

    # we found it, so eat extraniouse left hand side
    current_rdepend_version="${current_rdepend_version#*[}"

    # get just the version info
    current_rdepend_version="${current_rdepend_version##*/}"

    # if we have a version
    if [[ -n "$current_rdepend_version" ]]; then
      if declare -f _flannel_"$2"_comparator >/dev/null; then
        # first is it equal?
        if [[ "$current_rdepend_version" == "$3" || "$current_rdepend_version" == "$4" ]]; then
          return
        fi
        # else are we above our lower bound
        if _flannel_"$2"_comparator "$current_rdepend_version" ">" "$3"; then
          # are we below our upper bound?
          if _flannel_"$2"_comparator "$current_rdepend_version" "<" "$4"; then
            return
          fi
        fi
      else # use default
        # first is it equal?
        if [[ "$current_rdepend_version" == "$3" || "$current_rdepend_version" == "$4" ]]; then
          return
        fi
        # else are we above our lower bound
        if _flannel_catch_all_comparator "$current_rdepend_version" ">" "$3"; then
          # are we below our upper bound?
          if _flannel_catch_all_comparator "$current_rdepend_version" "<" "$4"; then
            return
          fi
        fi
      fi
    fi

    # if we got here we need to replace it, substitute the new version and return
    flannel "$2/${@:(-1)}"
    return
  done
}