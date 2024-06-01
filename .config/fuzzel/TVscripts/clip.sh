#!/bin/sh
# Description: a script which can show clipboard by fuzzel.

cliphist list | fuzzel --config ~/.config/fuzzel/TVfuzzel.ini --layer=overlay -d -p "Clipboard " | cliphist decode | wl-copy
