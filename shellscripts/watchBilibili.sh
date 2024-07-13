#!/bin/sh

echo -e "\e[34mInput the url of the video:"
read burls

yt-dlp --cookies-from-browser firefox -o - "${burls}" | mpv -
