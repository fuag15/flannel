#!/bin/bash
in_path() { # returns 0 if in path, 1 if not in path
  if [[ "$!1" == *"${2}:"* || "$!1" == *"$2" || "$!1" == "$2" ]]; then # our path contains it
    return
  else # our path doesnt contain it
    return 1
  fi
}