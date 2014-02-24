#!/usr/bin/env bash
# repairs the nicklist of irssi
_flannel_irssi_tmux_repair(){
  tmux selectw -t irssi
  tmux selectp -t 0
  tmux killp -a
  _flannel_irssi_tmux_nickpane
}
