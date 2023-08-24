#!/bin/sh
# A script for starting browsers.

if (pgrep tofi > /dev/null); then
  killall -q tofi
else
  case $(printf "%s\n" "Cancel" "Firefox" "qutebrowser" | tofi -c ~/.config/tofi/soy-milk) in
    "Cancel")
      exit 0
      ;;
    "Firefox")
      MOZ_ENABLE_WAYLAND=1 firefox
      ;;
    "qutebrowser")
      qutebrowser
      ;;
  esac
fi
