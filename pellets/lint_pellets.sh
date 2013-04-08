#!/usr/bin/env bash
# lint pellets should be colled before anything in a configuration except any calls to lint_pellet
# lint pellets goes through our PLAID_PELLETS and removes and reverse dpendencies
# if we are not called with clear thin it simple returns.
# syntax: `lint_pellets <module> [clear]
# first, check if we got a clear, if not return
# next if its in our pellet path
#   if we dont satisfy it wiht any existing module in PLAID_SHEEP
#     remove from plaid pellets
#     clear the module!
#   else
#     return
lint_pellets() {
  # if we aren't clearing, we don't care
  if [[ "${@:(-1)}" != "clear" ]]; then
    return
  fi

  # do we have any pellet deps?
  local current; while [[ "$PLAID_PELLETS" == *":${1}["* ]]; do
    # get the first dep from the left
    current="${PLAID_PELLETS#:$1\[}"
    current="${current%%]*}"

    # clear it from our pellets
    export PLAID_PELLETS="${PLAID_PELLETS//:$1\[$current\]/}"

    # clear it because we just broke its dep
    flannel "$current" clear
  done
}