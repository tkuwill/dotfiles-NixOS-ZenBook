#!/bin/sh
# Description: show workspaces in use ny dunst.
# <a href="https://www.flaticon.com/free-icons/workspace" title="workspace icons">Workspace icons created by Uniconlabs - Flaticon</a>
curwork() {
  hyprctl workspaces | grep 'workspace' | awk '{print $3}' | sort -n | xargs
}

curwork

dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/network.png -t 8000 "Space $(curwork) in use."
