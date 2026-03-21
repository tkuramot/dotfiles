{ ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-j";
    keyMode = "vi";
    baseIndex = 1;
    historyLimit = 10000;
    extraConfig = ''
      # panes
      set -wg pane-base-index 1
      bind | split-window -h
      bind - split-window -v

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -r H resize-pane -L
      bind -r J resize-pane -D
      bind -r K resize-pane -U
      bind -r L resize-pane -R

      # windows
      set -g renumber-windows on

      # copy
      bind -T copy-mode-vi 'v' { send -X begin-selection }
      bind -T copy-mode-vi 'C-v' { send -X rectangle-toggle }
      bind -T copy-mode-vi 'V' { send -X select-line }
      bind -T copy-mode-vi 'Escape' { send -X clear-selection }

      bind -T copy-mode-vi 'y' { send -X copy-selection }
      bind -T copy-mode-vi 'Y' { send -X copy-end-of-line }

      # status bar
      set -g status-interval 1
      set -g status-right ""
      set -g default-terminal screen-256color
    '';
  };
}
