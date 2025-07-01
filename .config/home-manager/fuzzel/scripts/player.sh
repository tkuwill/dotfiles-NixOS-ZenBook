#!/bin/sh
# music.png is from https://icon-icons.com/icon/battery-3/64867.
# if you want to use this script of dmenu, you have to install "playerctl", "mpv" and "copyq" at first.

function now_play {
    playerctl metadata --format "{{ title }} 
{{ artist }} - {{ album }}"
}

function turls {
    cliphist list | sed '1 q' | awk '{print $2}'
}

function urls {
    cliphist list | sed '1 q' | awk '{print $2}'
}

function burls {
    cliphist list | sed '1 q' | awk '{print $2}'
}


function player {
    options="Cancel\nPlay-pause\nNext\nPrev\nNow_playing\nOpen_with_mpv_Yt\nYt live\nTwitch live\nOpen_with_mpv_BiliBili\nBLive"
    selected=$(echo -e $options | fuzzel --layer=overlay -d -p "playerctl ")
    if [[ $selected = "Play-pause" ]]; then 
        playerctl play-pause    
    elif [[ $selected = "Next" ]]; then 
        playerctl next
    elif [[ $selected = "Prev" ]]; then 
        playerctl previous
    elif [[ $selected = "Now_playing" ]]; then 
        dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/music.png -t 5000 "$(now_play)"
    elif [[ $selected = "Open_with_mpv_Yt" ]]; then 
	mpv $(urls)
    elif [[ $selected = "Yt live" ]]; then 
        mpv --cache=no "$(urls)"
    elif [[ $selected = "Twitch live" ]]; then 
	streamlink -p mpv -a '--no-cache' --twitch-disable-ads "$(turls)" 1080p60
    elif [[ $selected = "Open_with_mpv_BiliBili" ]]; then 
        yt-dlp --cookies-from-browser firefox -o - "$(burls)" | mpv -
    elif [[ $selected = "BLive" ]]; then 
	yt-dlp --cookies-from-browser firefox -o - "$(burls)" | mpv --no-cache -
    elif [[ $selected = "Cancel" ]]; then 
        return
    fi
}

player
