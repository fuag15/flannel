#!/usr/bin/env bash
# this is a function to leave pellet dependencies for programs 
# dependencies are in the form of <module>[rdepend]: 
# they are stored in PLAID_PELLETS
# sytnax is pellet <module> <operator> <version> <rdepend> [clear]
pellet() {
  # if its a clear remove our reverse depend
  if [[ "${@:(-1)}" == "clear" ]]; then
    export PLAID_PELLETS="${PLAID_PELLETS//:${1};${2};${3}\[$4\]/}"; return
  fi
  
  # if we havent already noted this pellet, note it
  if [[ "$PLAID_PELLETS" != *":$1;$2;$3[$4]"* ]]; then
    export PLAID_PELLETS="${PLAID_PELLETS}:$1;$2;$3[$4]"
  fi
}