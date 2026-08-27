if [[ -z "$TMUX" ]] && command -v tmux &>/dev/null; then
  exec tmux new-session -A -s default
fi
