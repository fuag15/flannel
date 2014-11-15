#!/usr/bin/env bash
# simply clears our line of sheep between runs just in case
# syntax `disperse`
# - just unset FLANNEL_SPOOL
_flannel_sheep_disperse() {
  unset FLANNEL_SPOOL
}