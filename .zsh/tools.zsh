# asdf
[ -e "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

# starship
command -v starship &>/dev/null && eval "$(starship init zsh)"

# zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# direnv
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"

# fzf
command -v fzf &>/dev/null && source <(fzf --zsh)

# git-completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# lazy loading
autoload -Uz compinit && compinit
