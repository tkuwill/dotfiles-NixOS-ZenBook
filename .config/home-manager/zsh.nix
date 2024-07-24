{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      directory = {
        truncation_length = 0;
        truncate_to_repo = false;

      };
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    enableCompletion = true;
    defaultKeymap = "emacs";
    localVariables = {
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=#f5f2f2,bg=#686868,bold,underline";
      TIMEFMT = "real\t%E\nuser\t%U\nsys\t%S\ncpu\t%P";

    };
    initExtraBeforeCompInit = ''
      autoload -Uz promptinit
      promptinit
      zstyle ':completion:*' menu yes select
    '';
    initExtra = ''
      bindkey "\e[3~" delete-char
      bindkey "\E[1~" beginning-of-line
      bindkey "\E[4~" end-of-line
      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^X^E" edit-command-line
      
      export LESS_TERMCAP_mb=$'\e[1;32m'
      export LESS_TERMCAP_md=$'\e[1;32m'
      export LESS_TERMCAP_me=$'\e[0m'
      export LESS_TERMCAP_se=$'\e[0m'
      export LESS_TERMCAP_so=$'\e[01;33m'
      export LESS_TERMCAP_ue=$'\e[0m'
      export LESS_TERMCAP_us=$'\e[1;4;31m'
       
    '';
    shellAliases = {
      lh = "ls -lah";
      la = "ls -la";
      musicDownloadTui = "/home/will/shellscripts/musicDownloadTui.sh";
      fzfmenu = "/home/will/shellscripts/fzfmenu";
      timer = "/home/will/shellscripts/timer2.sh";
      vpnLocation = "curl ipinfo.io/country";
      vpnCountry = "curl ifconfig.co/country";
    };
    history = {
      extended = true;
      path = "$HOME/.zsh_history";
      save = 99999;
      size = 99999;
      ignorePatterns = [
        "rm *"
        "pkill *"
        "shutdown now"
        "reboot"
        "Hyprland"
        "vim"
        "rm -rf *"
        "fastfetch"
        "vifm"
        "joshuto"
        "newsboat"
        "htop"
        "nmtui"
        "sudo intel_gpu_top"
        "tmux"
        "cd .."
        "cd"
        "bye"
        "exit"
        "lazygit"
        "acpi"
        "pwd"
      ];
    };
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
