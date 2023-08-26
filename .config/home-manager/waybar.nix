{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
          "custom/shwork"
          "custom/copy"
          "pulseaudio"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "idle_inhibitor"
          "battery"
          "tray"
          "clock"
        ];
        "hyprland/workspaces" = {
          active-only = "false";
          format = " {icon} ";
          format-icons = {
            "urgent" = "";
            "active" = "";
            "default" = "󰧞";
          };
          on-click = "activate";
        };
        "custom/shwork" = {
          format = "󰕮";
          tooltip = "false";
          on-click = "/home/will/.config/tofi/scripts/shwork.sh";
        };
        "hyprland/submap" = {
          format = "{}";
          max-length = 30;
          tooltip = "false";
        };
        "hyprland/window" = {
          format = "{}";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = [ "  󰒳" ];
            deactivated = [ "  󰒲" ];
          };
        };
        "tray" = {
          icon-size = 21;
          spacing = 5;
        };
        "custom/copy" = {
          format = "󰗊";
          tooltip = "false";
          on-click-right = "/home/will/.config/tofi/scripts/clip.sh";
          on-double-click-middle = "/home/will/.config/tofi/scripts/clipclean.sh";
        };
        "clock" = {
          timezone = "Asia/Taipei";
          interval = 1;
          format = "{:%H:%M:%S}";
          format-alt = "{:%Y-%m-%d(%a)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "months";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };
        "battery" = {
          interval = 20;
          states = {
            warning = 25;
            critical = 20;
          };
          format = "{time} {icon}";
          format-charging = "{capacity}% 🗲";
          format-plugged = "{capacity}% ";
          format-alt = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
        };
        "pulseaudio" = {
          format = "VOL {volume}%{icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = "VOL 🔇 {format_source}";
          format-source = "{volume}%";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
      };
    };
    style = ''

      * {
      /* `otf-font-awesome` is required to be installed for icons */
      font-family: FontAwesome, Arial, HackGen35ConsoleNF;
      font-size: 16px;
      }

      window#waybar {
      background-color: rgba(43, 48, 59, 0.5);
      border-bottom: 3px solid rgba(100, 114, 125, 0.5);
      color: #ffffff;
      transition-property: background-color;
      transition-duration: .5s;
      }


      /*
        window#waybar.empty {
        background-color: transparent;
        }
        window#waybar.solo {
        background-color: #FFFFFF;
        }
      */


      button {
      /* Use box-shadow instead of border so the text isn't offset */
      box-shadow: inset 0 -3px transparent;
      /* Avoid rounded borders under each button name */
      border: none;
      border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
      background: inherit;
      box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces {
      background-color: #11111b;
      color: #b4befe;
      }

      #workspaces button {
      background: #11111b;
      color: #b4befe;
      }

      #workspaces button.active {
      background-color: #fba922;
      color: #000000;
      }

      #mode {
      background-color: #64727D;
      border-bottom: 3px solid #ffffff;
      }

      #custom-copy {
      background-color: #FFFFFF;
      color: #000000;
      padding: 0 10px;
      }

      #custom-shwork {
      background-color: #F9F6EE;
      color: #000000;
      padding: 0 10px;
      }

      #clock,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
      padding: 0 10px;
      color: #ffffff;
      }

      #window {
      font-family: Noto Sans CJK TC;
      padding-left: 10px;
      padding-right: 10px;


      }
      #window,
      #workspaces {
      margin: 0 2px;
      }
      #submap {
      background-color: #f53c3c;
      padding: 0 10px;

      }
      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
      margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
      margin-right: 0;
      }

      #clock {
      background-color: #64727D;
      }

      #battery {
      padding: 0 10px;
      background-color: #ffffff;
      color: #000000;
      }

      #battery.charging, #battery.plugged {
      color: #ffffff;
      background-color: #26A65B;
      }

      @keyframes blink {
      to {
      background-color: #ffffff;
      color: #000000;
      }
      }

      #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #ffffff;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
      }

      label:focus {
      background-color: #000000;
      }

      #cpu {
      background-color: #2ecc71;
      color: #000000;
      }

      #memory {
      background-color: #9b59b6;
      }

      #disk {
      background-color: #964B00;
      }

      #backlight {
      background-color: #90b1b1;
      }

      #network {
      background-color: #2980b9;
      }

      #network.disconnected {
      background-color: #f53c3c;
      }

      #pulseaudio {
      background-color: #f1c40f;
      color: #000000;
      }

      #pulseaudio.muted {
      background-color: #90b1b1;
      color: #2a5c45;
      }

      #wireplumber {
      background-color: #fff0f5;
      color: #000000;
      }

      #wireplumber.muted {
      background-color: #f53c3c;
      }

      #custom-media {
      background-color: #66cc99;
      color: #2a5c45;
      min-width: 100px;
      }

      #custom-media.custom-spotify {
      background-color: #66cc99;
      }

      #custom-media.custom-vlc {
      background-color: #ffa000;
      }

      #temperature {
      background-color: #f0932b;
      }

      #temperature.critical {
      background-color: #eb4d4b;
      }

      #tray {
      background-color: #2980b9;
      }

      #tray > .passive {
      -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
      -gtk-icon-effect: highlight;
      background-color: #eb4d4b;
      }

      #idle_inhibitor {
      background-color: #2d3436;
      }

      #idle_inhibitor.activated {
      background-color: #ecf0f1;
      color: #2d3436;
      }

      #mpd {
      background-color: #66cc99;
      color: #2a5c45;
      }

      #mpd.disconnected {
      background-color: #f53c3c;
      }

      #mpd.stopped {
      background-color: #90b1b1;
      }

      #mpd.paused {
      background-color: #51a37a;
      }

      #language {
      background: #00b093;
      color: #740864;
      padding: 0 5px;
      margin: 0 5px;
      min-width: 16px;
      }

      #keyboard-state {
      background: #97e1ad;
      color: #000000;
      padding: 0 0px;
      margin: 0 5px;
      min-width: 16px;
      }

      #keyboard-state > label {
      padding: 0 5px;
      }

      #keyboard-state > label.locked {
      background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
      background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
      background-color: transparent;
      }

      '';
  };
}
