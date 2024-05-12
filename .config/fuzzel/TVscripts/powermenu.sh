#!/bin/sh
# power.png is from https://www.flaticon.com/free-icon-font/power_3917748?page=1&position=1&term=power

function ck {
    date "+%T"
}

function powermenu {
    options="Cancel\nLock\nSuspend\nLog Out\nShutdown\nRestart"
    selected=$(echo -e $options | fuzzel --config ~/.config/fuzzel/TVfuzzel.ini -d -p "What do you want to do ? ")
    if [[ $selected = "Shutdown" ]]; then 
	notify-send -i /home/will/Pictures/sysicon/power.png -u critical -t 0 "Now time is $(ck) . 
ASUS 'll be shutdown in 1 min. Use 'shutdown -c' to cancel." && shutdown
    elif [[ $selected = "Restart" ]]; then 
        notify-send -i /home/will/Pictures/sysicon/restart.png -u critical -t 0 "Computer will be rebooted in 30 secs." && sleep 30s && reboot
    elif [[ $selected = "Suspend" ]]; then 
       sleep 1s && systemctl suspend
    elif [[ $selected = "Log Out" ]]; then
       hyprctl dispatch exit 1
    elif [[ $selected = "Lock" ]]; then
       swaylock
    elif [[ $selected = "Cancel" ]]; then 
       return
    fi
}

powermenu
