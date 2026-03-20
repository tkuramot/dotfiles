# starship
command -v starship &>/dev/null && eval "$(starship init zsh)"

# zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# direnv
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"

# fzf
command -v fzf &>/dev/null && source <(fzf --zsh)

