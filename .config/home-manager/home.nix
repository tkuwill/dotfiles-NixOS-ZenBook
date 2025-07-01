{ config, pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  imports = [
    ./bat.nix
    ./bottom/bottom.nix
    ./dunst.nix
    ./foot/foot.nix
    ./fastfetch.nix
    ./hypr/hyprland.nix
    # ./hypr/hyprlock.nix
    ./hypr/hypridle.nix
    ./imv.nix
    ./newsboat.nix
    ./swaylock.nix
    ./tmux.nix
    ./waybar/waybar.nix
    ./yazi/yazi.nix
    ./zathura.nix
    ./zoxide.nix
    ./zsh.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "will";
  home.homeDirectory = "/home/will";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.parted
    pkgs.hugo
    pkgs.jiten
    pkgs.wiliwili
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    "${config.xdg.configHome}/bottom/bottom.toml".text = builtins.readFile ./bottom/bottom.toml;
    "${config.xdg.configHome}/yazi/keymap.toml".text = builtins.readFile ./yazi/keymap.toml;
    "${config.xdg.configHome}/mpv/mpv.conf".text = builtins.readFile ./mpv/mpv.conf;
    "${config.xdg.configHome}/mpv/input.conf".text = builtins.readFile ./mpv/input.conf;
    # "${config.xdg.configHome}/mpv/script-opts/quality-menu.conf".text = builtins.readFile ./mpv/script-opts/quality-menu.conf;
    # "${config.xdg.configHome}/mpv/script-opts/thumbfast.conf".text = builtins.readFile ./mpv/script-opts/thumbfast.conf;
    "${config.xdg.configHome}/hypr/hyprlock.conf".text = builtins.readFile ./hypr/hyprlock.conf;
    "${config.xdg.configHome}/labwc/rc.xml".text = builtins.readFile ./labwc/rc.xml;
    "${config.xdg.configHome}/labwc/menu.xml".text = builtins.readFile ./labwc/menu.xml;
    "${config.xdg.configHome}/labwc/autostart".text = builtins.readFile ./labwc/autostart;
    "${config.xdg.configHome}/labwc/shutdown".text = builtins.readFile ./labwc/shutdown;
    "${config.xdg.configHome}/labwc/environment".text = builtins.readFile ./labwc/environment;
    "${config.xdg.configHome}/labwc/themerc-override".text = builtins.readFile ./labwc/themerc-override;
    "${config.xdg.configHome}/waybar/winconfig".text = builtins.readFile ./waybar/winconfig;
    "${config.xdg.configHome}/waybar/winstyle.css".text = builtins.readFile ./waybar/winstyle.css;
    "${config.xdg.configHome}/foot/labfoot.ini".text = builtins.readFile ./foot/labfoot.ini;
    "${config.xdg.configHome}/fuzzel/fuzzel.ini".text = builtins.readFile ./fuzzel/fuzzel.ini;
    "${config.xdg.configHome}/fuzzel/menufuzzel.ini".text = builtins.readFile ./fuzzel/menufuzzel.ini;
    "${config.xdg.configHome}/clapboard/config.toml".text = builtins.readFile ./clapboard/config.toml;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/will/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  # Cursor config
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.comixcursors;
    name = "ComixCursors-Slim-Green";
    size = 32;
  };

  # GTK's config
  gtk.enable = true;
  gtk.cursorTheme = {
    package = pkgs.comixcursors;
    name = "ComixCursors-Slim-Green";
    size = 32;
  };
  gtk.font = {
    package = pkgs.noto-fonts-cjk-sans;
    name = "Noto Sans CJK TC Medium";
    size = 12;
  };

  # GTK icon theme
  gtk.iconTheme = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
