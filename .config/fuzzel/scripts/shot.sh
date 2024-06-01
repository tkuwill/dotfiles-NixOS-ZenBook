#!/bin/sh

function calendar {
    options="Cancel\nFull-screenshot\nSelect a region for screenshot"
    selected=$(echo -e $options | fuzzel --layer=overlay -d -p "Take a screenshot then edit it ! ")
    if [[ $selected = "Full-screenshot" ]]; then 
      grim - | swappy -f -
      dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/camera.png -t 3500 "Saved to ~/Pic./Editedshots/."
    elif [[ $selected = "Select a region for screenshot" ]]; then 
      grim -g "$(slurp -d)" - | swappy -f -
      dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/camera.png -t 3500 "Saved to ~/Pic./Editedshots/."
    elif [[ $selected = "Cancel" ]]; then 
      return
    fi
}

calendar
