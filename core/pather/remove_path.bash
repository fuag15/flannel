#!/usr/bin/env bash
# this is a helper function to make it easier for those who dont use bash to unset an env far
# should most likely never be used, use remove_from_path instead, its safer
remove_path() {
  unset "$1"
}
