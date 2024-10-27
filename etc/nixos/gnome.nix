## bspwm's config
{ config, pkgs, ... }:

{
  # FOR gnome
  services.xserver =
    {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  # Excluding some GNOME applications from the default install
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-console
  ]) ++ (with pkgs; [
    gnome-maps
    gnome-music
    tali
    iagno
    hitori
    atomix
    cheese
    gnome-terminal
    epiphany
    geary
    totem
    nautilus
  ]);

}
