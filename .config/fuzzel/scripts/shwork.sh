#!/bin/sh
# Description: show workspaces in use ny dunst.
# <a href="https://www.flaticon.com/free-icons/workspace" title="workspace icons">Workspace icons created by Uniconlabs - Flaticon</a>
curwork() {
  # hyprctl workspaces | grep 'workspace' | awk '{print $3}' | sort -n | xargs
  niri msg workspaces | sed '1 d' | xargs
}

curwork

dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/network.png -t 8000 "Spaces $(curwork) Now in use."
