#!/usr/bin/env bash
# usefull for keeping track of path states
# this returns truthy if it is in our path, falsey if not
# it takes the name of the path to check against and what to check it for as first and second arg
# note, do not pass path variables here, just path names
# the booleans check these three in order, left to right
# - in the middle or front of path?
# - at the end of path?
in_path() { # returns 0 if in path, 1 if not in path
  [[ "${!1}" == "${2}" || "${!1}" == "${2}:"* || "${!1}" == *":${2}:"* || "${!1}" == *":${2}" ]]
}