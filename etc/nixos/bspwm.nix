## bspwm's config
{ config, pkgs, ... }:

{

  services.xserver.windowManager.bspwm.enable = true;
  environment.systemPackages = [
    pkgs.copyq
    pkgs.dmenu
    pkgs.feh
    pkgs.rxvt-unicode-emoji
    pkgs.sxhkd
    pkgs.polybarFull
  ];








}
