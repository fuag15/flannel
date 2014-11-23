#!/usr/bin/env bash
# this is a function to leave pellet dependencies for programs 
# dependencies are in the form of <module>[rdepend]: 
# they are stored in FLANNEL_REVERSE_DEPENDENCIES
# sytnax is pellet <module> <operator> <version> <rdepend> [clear]
define_reverse_dependency() {
  # if its a clear remove our reverse depend
  if [[ "${@:(-1)}" == "clear" ]]; then
    export FLANNEL_REVERSE_DEPENDENCIES="${FLANNEL_REVERSE_DEPENDENCIES//:${1};${2};${3}\[$4\]/}"; return
  fi
  
  # if we havent already noted this pellet, note it
  if [[ "$FLANNEL_REVERSE_DEPENDENCIES" != *":$1;$2;$3[$4]"* ]]; then
    export FLANNEL_REVERSE_DEPENDENCIES="${FLANNEL_REVERSE_DEPENDENCIES}:$1;$2;$3[$4]"
  fi
}
