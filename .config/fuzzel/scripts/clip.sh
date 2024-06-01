#!/bin/sh
# Description: a script which can show clipboard by fuzzel.

cliphist list | fuzzel --layer=overlay -d -p "Clipboard " | cliphist decode | wl-copy
