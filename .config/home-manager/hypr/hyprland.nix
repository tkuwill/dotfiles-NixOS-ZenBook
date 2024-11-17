{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";
      monitor = "eDP-1,1920x1080@60,1280x0,auto";
      # Start when Hyprland launched
      exec-once = [
        "hypridle"
        "thunar --daemon"
        "waybar"
        "wl-paste --type text --watch cliphist store #Stores only text data"
        "wl-paste --type image --watch cliphist store #Stores only image data"
        "dunst"
        "fcitx5"
        "nm-applet"
        "/home/will/.dwm/lowbatremind.sh"
        "/nix/store/$(ls -la /nix/store | grep 'mate-polkit' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-mate-authentication-agent-1"
      ];
      env = "XCURSOR_SIZE,32";
      input = {
        kb_layout = "us";
        follow_mouse = 2;
        natural_scroll = "yes";
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          natural_scroll = "yes";
          clickfinger_behavior = true;
          tap-and-drag = true;
          tap-to-click = true;
        };
      };
    };
    extraConfig = ''
      general {
        gaps_in = 0
        gaps_out = 0
        border_size = 6
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
        layout = master
      }
      decoration {
        rounding = 0
      }
      animations {
        enabled = no
      }
      dwindle {
       pseudotile = yes
       preserve_split = yes
      }
      master {
        new_status = master
      }
       gestures {
        workspace_swipe = on
        workspace_swipe_fingers = 3
      }
      windowrule = float, ^(nm-connection-editor)$
      windowrulev2 = float,class:^(nm-connection-editor)$,title:^(Network Connections)$
      windowrulev2 = float,class:^(org.fcitx.)$,title:^(Fcitx Configuration)$
      windowrulev2 = float,class:^(GTK Application)$,title:^(Save File)$ 
      windowrulev2 = float,class:^(pavucontrol)$,title:^(Volume Control)$ 
      windowrulev2 = float,class:^(com.github.huluti.Curtail)$,title:^(Curtail)$ 
      windowrulev2 = float,class:^(firefox)$,title:^(Password Required - Mozilla Firefox)$ 
      windowrulev2 = float,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$ 
      windowrulev2 = center,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$ 
      windowrulev2 = maxsize [5] [5],class:^(firefox)$,title:^(Firefox — Sharing Indicator)$ 
      windowrulev2 = noborder,class:^(Waydroid)$,title:^(Waydroid)$ 
      
      binde=, XF86AudioRaiseVolume, exec, /home/will/.dwm/volume.sh up
      binde=, XF86AudioLowerVolume, exec, /home/will/.dwm/volume.sh down
      binde=, XF86AudioMute, exec, /home/will/.dwm/volume.sh mute
      binde=, XF86MonBrightnessUp, exec, /home/will/.dwm/screenlight.sh up
      binde=, XF86MonBrightnessDown, exec, /home/will/.dwm/screenlight.sh down
      binde=, XF86AudioPlay, exec, playerctl play-pause
      binde=, XF86AudioNext, exec, playerctl next
      binde=, XF86AudioPrev, exec, playerctl previous
      
      bind=SUPER_SHIFT, Q, exec, [float;noanim;rounding 8;size 500 150] /home/will/.config/fzfmenu/scripts/shot.sh
      bind=SUPER_SHIFT, A, exec, grim && mv ~/Pictures/*_grim.png ~/Pictures/screenshots && dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/camera.png -t 3500 "Saved to ~/Pic./screenshots" 
      bind=SUPER_SHIFT, Z, exec, grim -g "$(slurp -d)" && mv ~/Pictures/*_grim.png ~/Pictures/screenshots && dunstify -a "changeVolume" -i /home/will/Pictures/sysicon/camera.png -t 3500 "Saved to ~/Pic./screenshots" 
      bind=SUPER_SHIFT, S, exec, [float;noanim;rounding 8;size 500 250] /home/will/.config/fzfmenu/scripts/powermenu.sh
      bind=SUPER_SHIFT, P, exec, [float;noanim;rounding 8;size 500 200] /home/will/.config/fzfmenu/scripts/player.sh
      bind=SUPER_SHIFT, L, exec, [float;noanim;rounding 8;size 300 100] /home/will/.config/fzfmenu/scripts/calendar.sh
      bind=SUPER_SHIFT, B, exec, [float;noanim;rounding 8;size 300 200] /home/will/.config/fzfmenu/scripts/sys.sh
      bind=SUPER_SHIFT, D, exec, [float;noanim;rounding 8;size 300 250] /home/will/.config/fzfmenu/scripts/donotdisturb.sh
      bind=SUPER, W, exec, /home/will/.config/tofi/scripts/shwork.sh
      bind=SUPER, A, exec, hyprctl dispatch workspace e-1
      bind=SUPER, Z, exec, hyprctl dispatch workspace e+1
      bind=SUPER, Tab, exec, [float;noanim;rounding 8;size 600 400] /home/will/.config/fzfmenu/scripts/clientswitcher.sh
      bind=SUPER, V, exec, [float;noanim;rounding 8;size 600 400] /home/will/.config/fzfmenu/scripts/clip.sh
      
      bind=SUPER_SHIFT, Return, exec, foot
      bind=SUPER_SHIFT, C, killactive, 
      bind=SUPER_SHIFT, U, exit, 
      bind=SUPER, E, exec, thunar
      bind=SUPER, P, exec, [float;noanim;rounding 8;size 500 500] j4-dmenu-desktop --display-binary --no-generic --term=xterm --usage-log=$HOME/.j4-dmenu-desktop.log --dmenu='~/shellscripts/fzfmenu'
      bind=SUPER,F,togglefloating
      bind=SUPER, M, exec, hyprctl dispatch fullscreen 1
      bind=SUPER_SHIFT, F, exec, hyprctl dispatch fullscreen 0
      bind=SUPER, Space, movefocus, l
      bind=SUPER, K, movefocus, u
      bind=SUPER, J, movefocus, d
      binde=SUPER,h,exec, hyprctl dispatch resizeactive -70 0
      binde=SUPER,l,exec, hyprctl dispatch splitratio 0.05 
      bind=SUPER,Return,movewindow,l
      bind=SUPERSHIFT,left,movewindow,l
      bind=SUPERSHIFT,right,movewindow,r
      bind=SUPERSHIFT,up,movewindow,u
      bind=SUPERSHIFT,down,movewindow,d
      bind=SUPER, 1, workspace, 1
      bind=SUPER, 2, workspace, 2
      bind=SUPER, 3, workspace, 3
      bind=SUPER, 4, workspace, 4
      bind=SUPER, 5, workspace, 5
      bind=SUPER, 6, workspace, 6
      bind=SUPER, 7, workspace, 7
      bind=SUPER, 8, workspace, 8
      bind=SUPER, 9, workspace, 9
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      bindm=SUPER, ALT_L, resizewindow

      bind=ALT,R,submap,resize
      submap=resize
      binde=,D,resizeactive,10 0
      binde=,A,resizeactive,-10 0
      binde=,W,resizeactive,0 -10
      binde=,S,resizeactive,0 10
      binde=SUPER,D,moveactive,10 0
      binde=SUPER,A,moveactive,-10 0
      binde=SUPER,W,moveactive,0 -10
      binde=SUPER,S,moveactive,0 10
      bind=,escape,submap,reset 
      submap=reset
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

    '';
  };
}
