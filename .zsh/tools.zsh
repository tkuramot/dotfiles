[ -e "$HOME/.asdf/asdf.sh"] && . "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

command -v starship &>/dev/null && eval "$(starship init zsh)"

command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
