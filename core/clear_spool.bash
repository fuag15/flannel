#!/usr/bin/env bash
# simply clears our spool of modules currently being processed
# syntax `_flannel_core_clear_spool`
# - just unset FLANNEL_SPOOL
_flannel_core_clear_spool() {
  unset FLANNEL_SPOOL
}
