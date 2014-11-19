#!/usr/bin/env bash
# this function fetches the given repository and places it in contrib in the form of
# /contrib/repouser/reponame/contents_of_repo
# repositories can by pineed by branch and by commit tag by supplying them as optional
# positional arguments
# a branch must be specified if you want to also specify a comit level
# if the target directory already exists, nothing happens
# it also takes the username / repo out of arguments to allow for
# custom git setups for internal use in orgs
# example syntax
# thrift_fetch <git uri> <username> <repo> [branch_or_tag] [revision_hash]
thrift_fetch() {
  # only continue if the directory does exist
  if [[ ! -d ~/.flannel/contrib/${2}/${3} ]]; then
    # create directory
    mkdir -p ~/.flannel/contrib/"${2}"/"${3}"
    # clone utility
    git clone "${1}" ~/.flannel/contrib/"${2}"/"${3}"

    # if there was also a branch switch to it
    if [ $# -ge 4 ]; then
      cd ~/.flannel/contrib/"${2}"/"${3}"
      git checkout "${4}"

      # if there was also a specific revision specified take care of that
      if [ $# -ge 5 ]; then
        git checkout "${5}"
      fi
    fi
  fi
}
