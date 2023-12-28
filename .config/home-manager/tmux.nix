{
  programs.tmux = {
    enable = true;
    clock24 = true;
    historyLimit = 30000;
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -g set-titles on
      set -g set-titles-string '#{pane_current_command} - #T'
      set-option -g mouse on
      setw -g mode-keys vi
      set-option -s set-clipboard off
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X rectangle-toggle
      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'wl-copy'
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'wl-copy'
      set -g status-interval 45
      set -g status-bg white
      set -g status-fg colour235
      set -g status-left '#[fg=colour255]Sess_#S'
      set -g status-right "#[fg=colour255] BAT #(acpi | grep 'Battery 0'| awk '{print $5,$6,$7}')"
      set-option -g status-justify centre
      setw -g window-status-current-style 'fg=colour233 bg=colour45 bold'
      setw -g window-status-current-format 'Win_#I#[fg=colour233]:#[fg=colour233]#W#[fg=colour233]#F '
      setw -g window-status-style 'fg=colour255 bg=colour248'
      setw -g window-status-format ' #I#[fg=colour255]:#[fg=colour255]#W#[fg=colour255]#F '
    '';
  };
}
