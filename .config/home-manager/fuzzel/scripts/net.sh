#!/bin/sh
# Description: a script which can show network name & link quality on waybar tooltip.

iwconfig wlp0s20f3 | sed '1 q' | awk '{print $4}' | sed -e 's/"//' && iwconfig wlp0s20f3 | sed -n "6p" | awk '{print $1 $2}'
