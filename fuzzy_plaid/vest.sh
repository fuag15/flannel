#!/bin/bash
# to all the flannel vested on us
vest() {
  clean_table
  flannel "$@"
}