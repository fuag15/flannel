#!/usr/bin/env bash
git_quick_clone() {
  for repo in "$@"; do
    git clone git@github.com:"$repo"
  done
}