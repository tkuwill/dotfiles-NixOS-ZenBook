#!/bin/sh
#
PS3="Video Entertainment: "

items=("Bilibili" "BLive" "Yt" "YtLive" "Twitch" "quit")
select opt in "${items[@]}" 
	  do

	  case $opt in
	    Bilibili)
	      echo -e "\e[34mInput the url of the video:"
	      read burls
	      yt-dlp --cookies-from-browser firefox -o - "${burls}" | mpv -
              break
	      ;;
	    BLive)
	      echo -e "\e[34mInput the url of the video:"
	      read blurls
	      mpv --cache=no --referrer="https://www.bilibili.com" "${blurls}"
              break
	      ;;
	    Yt)
	      echo -e "\e[34mInput the url of the video:"
	      read urls
	      mpv ${urls}
              break
	      ;;
	    YtLive)
	      echo -e "\e[34mInput the url of the video:"
	      read yurls
	      mpv --cache=no "${yurls}"
              break
	      ;;
	    Twitch)
	      echo -e "\e[34mInput the url of the video:"
	      read turls
	      streamlink -p mpv -a '--no-cache' --twitch-disable-ads "${turls}" 1080p60
              break
	      ;;
            quit)
              break
              ;;
	      *) 
              echo "Invalid option $REPLY"
              ;;
              esac
	      done
