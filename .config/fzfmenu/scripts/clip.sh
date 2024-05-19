#!/bin/sh
# Description: a script which can show clipboard by fuzzel.

cliphist list | ~/shellscripts/fzfmenu | cliphist decode | wl-copy
