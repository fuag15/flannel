#!/usr/bin/env bash
# simply clears our line of sheep between runs just in case
# syntax `disperse`
# - just unset FLANNEL_SPOOL
_flannel_core_clear_spool() {
  unset FLANNEL_SPOOL
}