#!/usr/bin/env bash
# spec_plaid *[subdirs]*
# - test all modules under each subdir with a /tests folder
# - defaults to testing all
# - each test print 
# - <blah>
# - [ <tests> ]
spec_plaid() {
  # if we arent using bash 4
  if [[ "${BASH_VERSION%%[![:digit:]]*}" != "4" ]]; then
    echo "Sorry, only bash 4 and greater is supported for tests, bash 4 was released in 2009"; return
  fi

  shopt -s extglob nullglob globstar
  # if we were not passed any params glom all tests
  if [[ "$#" == 0 ]]; then
    local module_test; for module_test in ~/.flannel/**/tests; do
      shopt -u extglob nullglob globstar
      tput setaf 3
      tput bold
      echo "${module_test#~/.flannel/}"
      tput setaf 7
      echo -n "[ "
      tput sgr0
      vest "${module_test#~/.flannel/}"
      tput setaf 7
      tput bold
      echo " ]"
      tput sgr0
      shopt -s extglob nullglob globstar
    done
  else
    local test_glob; for test_glob in "$@"; do
      local module_test; for module_test in ~/.flannel/$test_glob/**/tests; do
        shopt -u extglob nullglob globstar
        tput setaf 3
        tput bold
        echo "${module_test#~/.flannel/}"
        tput setaf 7
        echo -n "[ "
        tput sgr0
        vest "${module_test#~/.flannel/}"
        tput setaf 7
        tput bold
        echo " ]"
        tput sgr0
        shopt -s extglob nullglob globstar
      done
    done
  fi
  shopt -u extglob nullglob globstar
}