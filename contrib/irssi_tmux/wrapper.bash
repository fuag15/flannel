#!/usr/bin/env bash
# wraps irrssi to start with nickpane correct
flannel_irssi_tmux_wrapper() {
    _flannel_irssi_tmux_nickpane
    $(which irssi) 
}
