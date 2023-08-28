{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = 350;
        height = 300;
        origin = "top-right";
        offset = "60x50";
        scale = 0;
        notification_limit = 0;
        progress_bar = true;
        progress_bar_height = 20;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 350;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 3;
        gap_size = 3;
        separator_color = "frame";
        sort = "yes";
        font = "Noto Sans CJK TC 14";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        enable_recursive_icon_lookup = true;
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 32;
        icon_theme = "Adwaita";
        icon_path = "/run/current-system/sw/share/icons/Adwaita/32x32/status:/run/current-system/sw/share/icons/Adwaita/32x32/devices";
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 0;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
        frame_color = "#1E66F5";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        timeout = 10;
        background = "#EFF1F5";
        foreground = "#4C4F69";
      };
      urgency_normal = {
        timeout = 10;
        background = "#EFF1F5";
        foreground = "#4C4F69";
      };
      urgency_critical = {
        timeout = 0;
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#FE640B";
      };
      history_ignore = {
        appname = "changeVolume";
        history_ignore = "yes";
      };
      history-ignore-2 = {
        appname = "center";
        history_ignore = "yes";
      };
    };
  };
}
