#!/usr/bin/env bash
# try to be smart about dependencies while cleaning a repo
# thrift_clean <prefix>
# exit 0 on a collision detected so other scripts can inspect if desired
thrift_clean() {
  # dont run if this is accidently called with wrong args
  if [ $# -eq 1 ]; then
    shopt -s globstar
    for file in ~/.flannel/contrib/**/dependencies.thrift; do
      if cat "${file}" | grep "${1/\// }" >/dev/null; then
        shopt -u globstar
        return
      fi
    done
    shopt -u globstar
    thrift_remove "${1}"
  fi
}
