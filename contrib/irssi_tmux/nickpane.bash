#!/usr/bin/env bash
# opens up a nickpan from irssi using tmux
_flannel_irssi_tmux_nickpane() {
  tmux renamew irssi 
  tmux -q setw main-pane-width $(( $(tput cols) - 21)) 
  tmux splitw -v "cat ~/.irssi/nicklistfifo"
  tmux -q selectl main-vertical
  tmux selectw -t irssi  
  tmux selectp -t 0  
}
