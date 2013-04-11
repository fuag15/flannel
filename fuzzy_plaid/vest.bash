#!/usr/bin/env bash
# to all the flannel vested on us
# This is a utility funciton to manually load
# modules, it is the mane interface to flannel for the end user
# it clears our crumbs from the last run and then passes off vars to flannel
vest() {
  _flannel_fuzzy_plaid_clean_table

  # clear our old sheep
  _flannel_sheep_disperse
  
  flannel "$@"
}