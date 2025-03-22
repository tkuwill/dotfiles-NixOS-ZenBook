# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
    "kernel.sysrq" = 1;
  };

  networking.hostName = "ZenBookNixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openvpn
    networkmanager-l2tp
  ];

  # Set your time zone.
  time.timeZone = "Asia/Taipei";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = [
      pkgs.terminus_font
    ];
    font = "ter-v32n";
    keyMap = "us";
    #   useXkbConfig = true; # use xkbOptions in tty.
  };
  # Power management
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
    HandlePowerKeyLongPress=poweroff
  '';
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # For cosmic desktop environment
  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;
  # services.flatpak.enable = true;
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # QEMU'sconfig
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  # virtualbox
  # virtualisation.virtualbox.host.enableKvm = true;
  # virtualisation.virtualbox.host.enableHardening = false;
  # virtualisation.virtualbox.host.addNetworkInterface = false;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.host.enable = true;


  # Waydroid's config
  virtualisation.waydroid.enable = true;
  # Cursor size
  environment.variables.XCURSOR_SIZE = "32";
  services.xserver.dpi = 128;
  services.xserver.upscaleDefaultCursor = true;
  # hyprland config
  programs.hyprland.enable = true;
  programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };
  #services.pipewire.wireplumber.enable = true;
  #security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #  # If you want to use JACK applications, uncomment this
    #  #jack.enable = true;
  };
  #river 
  # programs.river.enable = true;


  # Waybar, mpv's custom builds
  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = with self.mpvScripts; [
          mpris
          mpv-playlistmanager
          quality-menu
          thumbfast
          uosc
        ];
      };
    })
    # (self: super: {
    #   waybar = super.waybar.overrideAttrs (oldAttrs: {
    #     mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #   });
    # })
  ];

  # Service for thunar
  programs.thunar.enable = true;
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  # thunar and its plugins
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-volman
    thunar-media-tags-plugin
  ];

  # Service for polkit
  security.polkit.enable = true;
  # fzf's config this two configs are not availible in nix
  # programs.fzf.keybindings = true;
  # programs.fzf.fuzzyCompletion = true;
  # zsh's config
  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.autosuggestions.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];
  environment.shells = with pkgs; [ zsh ];
  # Bluetooth
  hardware.bluetooth.package = pkgs.bluez;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  powerManagement.resumeCommands = ''
    rfkill block bluetooth
    rfkill unblock bluetooth
  '';

  ## Lock screen before suspend
  # services.physlock.enable = true;
  # services.physlock.lockOn.suspend = true;
  # services.physlock.lockMessage = "Welcome Back will";
  # sudoedit's editor
  environment.variables.EDITOR = "vim";

  # Hardware acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.libinput.mouse.naturalScrolling = true;
  services.libinput.touchpad.naturalScrolling = true;

  # screen backlight
  programs.light.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.will = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" "input" "libvirtd" "kvm" "vboxusers" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # For virtual machine use windows
    dmidecode
    qemu
    # niri
    vim-full # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    ## icon theme
    glib
    adwaita-icon-theme
    # cursor
    comixcursors.Slim_Green
    # polkit-authentication
    mate.mate-polkit
    # WM needed
    cliphist
    dunst
    foot
    font-awesome
    gedit
    hyprpaper
    pavucontrol
    # symbola
    # swaylock-effects
    # fuzzel
    j4-dmenu-desktop
    waybar
    wl-clipboard
    # screenshots tools
    grim
    swappy
    slurp
    # cli-tools
    alsa-utils
    acpi
    bat
    cmus
    dialog
    fastfetch
    fbterm # for cjk in tty
    git
    imv # cli-img-viewer
    intel-gpu-tools
    imagemagick # image edit command line
    jq # for json query
    killall
    lzip
    lm_sensors
    lazygit
    libnotify
    newsboat
    python3
    playerctl
    pngquant # png optimizer
    parted # Create, destroy, resize, check, and copy partitions
    shellcheck
    streamlink
    tree
    tlrc # For tldr, a modern and simpler man.
    tmux
    unar
    wget
    wirelesstools # for internet test
    w3m
    wcalc # calculator
    xdg-user-dirs
    # sys-tools
    # entertainment
    kdePackages.kasts
    # gpodder
    # Internet
    firefox
    google-chrome
    vivaldi
    vivaldi-ffmpeg-codecs
    # chromium
    # (chromium.override {
    #   commandLineArgs = [
    #     "--ozone-platform-hint=auto"
    #     # "--gtk-version=4"
    #     "--enable-wayland-ime"
    #     "--enable-features=TouchpadOverscrollHistoryNavigation"
    #   ];
    # })
    thunderbird-esr
    signal-desktop
    networkmanagerapplet
    # website developed
    nodePackages_latest.live-server
    python311Packages.grip # Preview GitHub Markdown files like Readme locally before committing them
    # for vim-codefmt's engine
    nodePackages_latest.js-beautify
    nixpkgs-fmt
    shfmt
    ## For office, only use libreoffice-fresh package. 
    ## Bc in NixOS, libreoffice-fresh = libreoffice-still in archlinux
    libreoffice-still
    font-manager
    zathura
    ## Dictionary
    tagainijisho # For EN to JP
    # wordbook # EN to EN dict
    # video player
    yt-dlp
    ffmpeg
    mpv
    ## Qt library
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    # (pkgs.wrapOBS {
    #   plugins = with pkgs.obs-studio-plugins; [
    #     wlrobs
    #     obs-vaapi
    #     obs-nvfbc
    #     obs-teleport
    #     droidcam-obs
    #     obs-vkcapture
    #     obs-gstreamer
    #     obs-3d-effect
    #     input-overlay
    #     obs-multi-rtmp
    #     obs-source-clone
    #     obs-shaderfilter
    #     obs-source-record
    #     obs-livesplit-one
    #     looking-glass-obs
    #     obs-vintage-filter
    #     obs-command-source
    #     obs-move-transition
    #     obs-backgroundremoval
    #     advanced-scene-switcher
    #     obs-pipewire-audio-capture
    #   ];
    # })

  ];




  # Input method fcitx5
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-rime
      fcitx5-gtk
      fcitx5-lua
    ];
  };


  # Font
  fonts.packages = with pkgs;
    [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra
      liberation_ttf
      hackgen-nf-font # Nerd font used for terminal and waybar.
    ];
  # Font configs
  fonts.fontconfig.defaultFonts.serif = [
    "Noto Serif CJK TC"

  ];
  fonts.fontconfig.defaultFonts.sansSerif = [
    "Noto Sans CJK TC"
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "Noto Sans Mono CJK TC"
    "HackGen35ConsoleNF"
  ];
  fonts.fontconfig.defaultFonts.emoji = [
    "Noto Color Emoji"

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
