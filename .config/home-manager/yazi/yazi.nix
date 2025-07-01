{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      headsup = {
        disable_exec_warn = true;
      };
      mgr = {
        layout = [ 2 3 3 ];
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
        sort_sensitive = true;
        show_symlink = true;
        linemode = "size";
      };
      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
      };

    };
  };
}
