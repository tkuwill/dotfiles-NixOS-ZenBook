# dotfiles-NixOS-ZenBook
dotfiles of NixOS on ZenBook

---

## Features

Configured by **nix** and **home-manager**. (hm is *standalone* mode).

## Architecture

- `~/.config`
    - `home-manager`
        - `bat.nix`
        - `dunst.nix`
        - `foot.nix`
        - `home.nix` is for **gtk**, **cursor theme** and **font-config**.
        - `hyprland.nix`
        - `imv.nix`
        - `newsboat.nix`
        - `swaylock.nix`
        - `tmux.nix`
        - `waybar.nix`
        - `zathura.nix`
        - `zoxide.nix`
        - `zsh.nix`
            - `bottom`
                - `bottom.nix`
                - `bottom.toml`
            - `yazi`
                - `yazi.nix`
                - `keymap.toml`
            - `mpv`
                - `script-opts`
                    - `quality-menu.conf`
                    - `thumbfast.conf`
                - `input.conf`
                - `mpv.conf`
    - Other programs which cannot be configured by home-manager. Like, `fbterm`, `swappy`, `tofi`, `vifm`. Or some programs that I haven't used home-manager to configure, like `fuzzel`.
- `/etc/nixos/configuration.nix`
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

## A key for yazi 
`~` is the key for help. If forgetting the keybinds, it is a good cheatsheet.
## Some nix example

[wimpysworld/nix-config](https://github.com/wimpysworld/nix-config)

[~misterio/nix-config](https://git.sr.ht/~misterio/nix-config)
