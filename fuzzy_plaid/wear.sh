#!/bin/bash
# wear a config, you should always layer
wear() { 
  while read -r module; do
    flannel "$module"
  done
}