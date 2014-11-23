#!/usr/bin/env bash
# plaid_test <function>
# - run function as a test, if true print green .
# - if false print ' '<function name in red>' ;
plaid_test() {
  if "$1"; then
    tput bold
    tput setaf 2
    echo -n "."
    tput sgr0
  else
    tput bold
    tput setaf 1
    echo -n " $1 "
    tput sgr0
  fi
}
