bindkey -v

# Disable terminal flow control (XON/XOFF) so C-q / C-s reach apps like tmux
if [[ -t 0 ]]; then
  stty -ixon
fi

# history
bindkey '^R' history-incremental-search-backward
