#!/bin/bash
# spool us some modules
spool_some_flannel() {
  for module in "${1[@]}"; do
    flannel "$module"
  done
}