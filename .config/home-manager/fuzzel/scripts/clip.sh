#!/bin/sh
# Description: a script which can show clipboard by fuzzel.

cliphist list | fuzzel -a center -w 50 -l 20 --layer=overlay -d -p "Clipboard " | cliphist decode | wl-copy
