#!/bin/sh
# Description: Use tofi as a clients switcher.
# Credit from: https://www.reddit.com/r/hyprland/comments/113ofeq/script_with_rofi_to_see_open_apps_and_switch_to/
hyprctl clients | awk '/title: ./ { gsub("\t*title: *", ""); print}' | ~/shellscripts/fzfmenu | xargs -I{} hyprctl dispatch focuswindow "title:{}"
