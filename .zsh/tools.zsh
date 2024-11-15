# asdf
[ -e "$HOME/.asdf/asdf.sh"] && . "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

# starship
command -v starship &>/dev/null && eval "$(starship init zsh)"

# zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# git-completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# lazy loading
autoload -Uz compinit && compinit
