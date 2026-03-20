# tmux 自動起動
[[ -z "$TMUX" ]] && exec tmux new-session -A -s default
