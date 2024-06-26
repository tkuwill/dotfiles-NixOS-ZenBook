#!/bin/sh
# ram.png is from https://uxwing.com/ram-memory-icon.
# battery.png is from https://icon-icons.com/icon/battery-3/64867.
# cpu.png is from https://uxwing.com/cpu-icon.
# wifi.png is from https://icon-icons.com/icon/wifi-medium-signal-symbol-1/56451.
# no-wifi.png is from https://uxwing.com/no-wifi-icon.
# You have to install lm_sensors, acpi, libnotify and a notification package (like dunst) in order to use this script.

function mem {
    free -h | grep 'Mem' | awk '{print "Mem is used : "$3" / "$2"."}'
}


function battime {
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
        if [ "$STATUS" = "Discharging" ]; then
	    acpi | grep 'Battery 0' | awk '{print "BAT-time : " $5,$6"."}'
        elif [ "$STATUS" = "Charging" ]; then
	    acpi | grep 'Battery 0' | awk '{print "BAT-time : " $5,$6,$7"."}'
        elif [ "$STATUS" = "Full" ]; then
	    acpi | grep 'Battery 0'| sed '1 s/,//g' | awk '{print "Now BAT is "$3"."}'
        elif [ "$STATUS" = "Not charging" ]; then
            acpi | grep 'Battery 0' | sed '1 s/,//g' | awk '{print "Now BAT is "$3" "$4"."}'
        fi
}


function cpu_temp {
    sensors | grep 'Core 1' | sed '1 s/+/\ /g' | awk '{print "CPU temp : "$3"."}'
}


 function wlan {
  iwconfig wlo1 | sed '1 q' | awk '{print $4}' | sed -e 's/ESSID:"// ' | sed -e 's/"//' && iwconfig wlo1 | sed -n "6p" | awk '{ print $2}'

}



function bat_temp {
    acpi --thermal | grep -Eo '[0-9][0-9].[0-9]' | awk '{print "BAT temp : "$1"°C."}'
}

function sysinfo {
    options="Cancel\nMemory\nBAT-remaining\ncpu_temp\nBAT_temp"
    selected=$(echo -e $options | fuzzel --config ~/.config/fuzzel/TVfuzzel.ini --layer=overlay -d -p "System info ")
    if [[ $selected = "Memory" ]]; then 
        dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/ram.png -t 8000 "$(mem)" 
    elif [[ $selected = "BAT-remaining" ]]; then 
        dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/battery.png -t 8000 "$(battime)"  
    elif [[ $selected = "cpu_temp" ]]; then 
        dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/cpu.png -t 5000 "$(cpu_temp)"
    elif [[ $selected = "BAT_temp" ]]; then 
        dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/battery.png -t 8000 "$(bat_temp)"  
    elif [[ $selected = "Cancel" ]]; then 
        return
    fi

}

sysinfo
