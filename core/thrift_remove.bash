#!/usr/bin/env bash
# simply a wrapper to remove the repo entirely righ tnow
# thrift_remove <prefix>
thrift_remove() {
  # dont run this is accidently called with wrong args
  if [ $# -eq 1 ]; then
    rm -Rf ~/.flannel/contrib/"${1}"
  fi
}
