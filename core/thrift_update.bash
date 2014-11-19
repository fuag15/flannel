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
thrift_update() {
  # only continue if the directory does exist
  if [[ -d ~/.flannel/contrib/${1} ]]; then
    pushd ~/.flannel/contrib/"${1}" >/dev/null
    git pull origin
    popd >/dev/null
  fi
}
