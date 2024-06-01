#!/bin/sh

function calendar {
    options="Cancel\nthis-year\nnext-twelve-months"
    selected=$(echo -e $options | fuzzel --config ~/.config/fuzzel/TVfuzzel.ini --layer=overlay -d -p "Calendar ")
    if [[ $selected = "this-year" ]]; then 
        foot -T 'Calendar of this year' -e zsh -c 'cal -y; zsh'
    elif [[ $selected = "next-twelve-months" ]]; then 
        foot -T 'Calendar of next 12 months' -e zsh -c 'cal -Y; zsh'
    elif [[ $selected = "Cancel" ]]; then 
        return
    fi
}

calendar
