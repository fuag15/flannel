#!/bin/bash

# helper to swap rsa identities and git / hg configs
# takes the identity name base as an arg
swap_id() {
  # print help?
  if [[ "$#" == 0 ]]; then
    echo "identity_name"
    exit 0
  fi

  # copy rsa id over
  cp ~/.ssh/"${@}" ~/.ssh/id_rsa
  cp ~/.ssh/"${@}"_pub ~/.ssh/id_rsa.pub

  # remove stored keychain identities
  if [[ -x ssh-add ]]; then
    ssh-add -D
  fi

  # move git username
  cp ~/"${@}".gitconfig ~/.gitconfig

  # move hg username
  cp ~/"${@}".hgrc ~/.hgrc
}