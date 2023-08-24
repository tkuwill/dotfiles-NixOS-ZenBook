{
  programs.zathura = {
    enable = true;
    mappings = {
      "f" = "toggle_fullscreen";
      "[fullscreen] f" = "toggle_fullscreen";
      "<C-l>" = "nohlsearch";
    };
    options = {
      selection-clipboard = "clipboard";
      pages-per-row = 1;
      scroll-page-aware = "true";
      adjust-open = "best-fit";
      font = "Noto Sans CJK TC 15";
      statusbar-bg = "#073642";
      window-title-page = "true";
      window-title-basename = "true";
      open-first-page = "ture";
      statusbar-page-percent = "true";
      statusbar-home-tilde = "true";
      zoom-center = "true";
    };
  };
}
