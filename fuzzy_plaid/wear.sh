#!/usr/bin/env bash
# wear a config, you should always layer
# This is a utility function to assist in parsing our config files, one line at a time, to load modules
# used by jacket to load local, global, and named config files
_flannel_fuzzy_plaid_wear() { 
  while read -r module; do
    flannel "$module"
  done
}