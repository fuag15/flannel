#!/usr/bin/env bash
# wear a config, you should always layer
_flannel_fuzzy_plaid_wear() { 
  while read -r module; do
    flannel "$module"
  done
}