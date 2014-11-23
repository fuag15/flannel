#!/usr/bin/env bash
# to all the flannel vested on us
# This is a utility funciton to manually load
# modules, it is the mane interface to flannel for the end user
# it clears our crumbs from the last run and then passes off vars to flannel
vest() {
  # flush reverse_dependencies
  _flannel_core_clear_reverse_dependencies

  # clear our old sheep
  _flannel_core_clear_spool
  
  flannel "$@"
}
