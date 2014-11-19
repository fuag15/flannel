#!/usr/bin/env bash
# simply a wrapper to remove the repo entirely righ tnow
# thrift_remove <prefix>
thrift_remove() {
  # dont run this is accidently called with wrong args
  if [ $# -eq 1 ]; then
    # remove the repo
    rm -Rf ~/.flannel/contrib/"${1}"

    # if the parent directory is empty
    if (
         shopt -s nullglob dotglob
         local files=(~/.flannel/contrib/"${1%/*}"/*)
         (( ! ${#files[@]} ))
       ); then
       #remove it
       rm -Rf ~/.flannel/contrib/"${1%/*}"
    fi
  fi
}
