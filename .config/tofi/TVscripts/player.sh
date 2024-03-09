#!/bin/sh
# Description: a menu run by tofi for controlling media.
# music.png is from https://icon-icons.com/icon/battery-3/64867.

now_play() {
  playerctl metadata --format "{{ title }} 
{{ artist }} - {{ album }}"
}

now_play

urls() {
  cliphist list | sed '1 q' | awk '{print $2}'
}

urls

burls() {
  cliphist list | sed '1 q' | awk '{print $2}'
}

burls

if (pgrep tofi > /dev/null); then
  killall -q tofi
else
  case $(printf "%s\n" "Cancel" "Now playing" "Open with mpv Yt" "Yt live" "Twitch live" "Open with mpv BiliBili" "BLive" "Play-pause" "Next" "Prev" | tofi -c ~/.config/tofi/soy-milk) in
    "Cancel")
      exit 0
      ;;
    "Now playing")
      dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/music.png -t 5000 "$(now_play)"
      ;;
    "Open with mpv Yt")
      mpv "$(urls)"
      ;;
    "Yt live")
      mpv --cache=no "$(urls)"
      ;;
    "Twitch live")
      streamlink -p mpv -a '--no-cache' --twitch-disable-ads "$(turls)" 1080p60
      ;;
    "Open with mpv BiliBili")
      yt-dlp --cookies-from-browser firefox -o - "$(burls)" | mpv -
      ;;
    "BLive")
      mpv --cache=no --referrer="https://www.bilibili.com" "$(burls)"
      ;;
    "Play-pause")
      playerctl play-pause
      ;;
    "Next")
      playerctl next
      ;;
    "Prev")
      playerctl previous
      ;;
  esac
fi
