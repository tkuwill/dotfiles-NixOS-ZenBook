# dotfiles-NixOS-ZenBook
dotfiles of NixOS on ZenBook -- labwc & hyprland 

(Only show screenshots in **labwc**.)

![](/screenshots/labwc.png)


![](/screenshots/labwcfastfetch.png)

---

## Features

1. Configured by **nix** and **home-manager**. (hm is *standalone* mode).
2. The config of waybar used in labwc is from [win10-style-waybar](https://github.com/TheFrankyDoll/win10-style-waybar) but making a little change to suit my needs.

## Architecture

<details>
<summary><b>Files Architecture</b></summary>

- `~/.config`
    - `home-manager`
        - `bat.nix`
        - `dunst.nix`
        - `fastfetch.nix`
        - `home.nix` is for **gtk**, **cursor theme**, **font-config** and managing some dotfiles.
        - `imv.nix`
        - `newsboat.nix`
        - `swaylock.nix`
        - `tmux.nix`
        - `zathura.nix`
        - `zoxide.nix`
        - `zsh.nix`
            - `bottom`
                - `bottom.nix`
                - `bottom.toml`
            - `clapboard`
                - `config.toml`
            - `foot`
                - `foot.nix`
                - `labfoot.ini` -- used in **labwc**.
            - `fuzzel`
                - `scripts` -- shellscripts used by `fuzzel`.
                - `fuzzel.ini` -- config used by the `Nix button` on **waybar**.
                - `menufuzzel.ini` -- config used by **fuzzel launched by keybinding**.
            - `hypr`
                - `hypridle.nix`
                - `hyprland.nix`
                - `hyprlock.nix` -- not used.
                - `hyprlock.conf` -- used to config **hyprlock**.
            - `labwc`
                - `autostart`
                - `environment`
                - `menu.xml`
                - `rc.xml`
                - `shutdown`
                - `themerc-override`
            - `waybar`
                - `waybar.nix`
                - `winconfig` -- used in **labwc**.
                - `winstyle.css` --used in **labwc**.
            - `yazi`
                - `yazi.nix`
                - `keymap.toml`
            - `mpv`
                - `script-opts`
                    - `quality-menu.conf`
                    - `thumbfast.conf`
                - `input.conf`
                - `mpv.conf`
    - Other programs which cannot be configured by home-manager. Like, `fbterm`, `swappy`, `tofi`, `vifm`. Or some programs that I haven't used home-manager to configure.
- `/etc/nixos`
    - `configuration.nix`
    - `bspwm.nix` 
    - `gnome.nix`
    - `flake.nix`
    - `flake.lock`
- `~/.vimrc`
- `~/.dwm`
    - `lowbatremind.sh`
    - `screenlight.sh`
    - `volume.sh`
- `~/shellscripts`
    - `musicDownloadTui.sh`
    - `reminder.sh`
    - `timer2.sh`
- `~/.local/share/fcitx5/rime/`
    - `opencc` is the folder for emoji.
    - `default.custom.yaml`
    - `terra_pinyin.custom.yaml`

</details>

## A key for yazi 
`~` is the key for help. If forgetting the keybinds, it is a good cheatsheet.
## Some nix example

[wimpysworld/nix-config](https://github.com/wimpysworld/nix-config)

[~misterio/nix-config](https://git.sr.ht/~misterio/nix-config)
