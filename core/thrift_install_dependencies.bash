#!/usr/bin/env bash
# installs requirements for module if they are present
# thrift_install <module>
# where module is relative to flannel install
thrift_install_dependencies() {
  # only if there are dependencies
  # only continue if the directory does exist
  if [ -f ~/.flannel/"${1}"/dependencies.thrift ]; then
    # run the script, this should install deps
    . ~/.flannel/"${1}"/dependencies.thrift
  fi
}
