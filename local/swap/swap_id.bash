#!/usr/bin/env bash
# helper to swap rsa identities and git / hg configs
# takes the identity name base as an arg
swap_id() {
  # print help?
  if [[ "$#" == 0 ]]; then
    echo "identity_name"
    exit 0
  fi

  # copy rsa id over I find this easier than maintaining a .ssh config per host
  # although it is more dangerouse
  cp ~/.ssh/"$@" ~/.ssh/id_rsa
  cp ~/.ssh/"$@"_pub ~/.ssh/id_rsa.pub

  # remove stored keychain identities
  ssh-add -D
  
  # add new identities
  ssh-add

  # move git username
  cp ~/."$@".gitconfig ~/.gitconfig

  # move hg username
  cp ~/."$@".hgrc ~/.hgrc
}
