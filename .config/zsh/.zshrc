export LANG=en_US.UTF-8
export EDITOR=vim
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# colorize man command
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Nix (multi-user daemon install) — restore after macOS/CLT updates wipe /etc/zshrc
if [[ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
  source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

typeset -U path
path=(~/.local/bin /run/current-system/sw/bin(N) $path)

if [[ -z "$TMUX" ]] && command -v tmux &>/dev/null; then
  exec tmux new-session -A -s default
fi

zsh_state_dir=${XDG_STATE_HOME:-$HOME/.local/state}/zsh
zsh_cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/zsh
mkdir -p "$zsh_state_dir" "$zsh_cache_dir"

HISTFILE=$zsh_state_dir/history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_BEEP
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CORRECT

alias g='git'
alias mkdir='mkdir -p'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias cls='clear && printf "\033[3J"'

cg() {
  local dir
  dir=$(ghq list | fzf) && cd "$(ghq root)/$dir"
}

bindkey -v
KEYTIMEOUT=1
bindkey '^R' history-incremental-search-backward

# Disable terminal flow control (XON/XOFF) so C-q / C-s reach apps like tmux
[[ -t 0 ]] && stty -ixon

autoload -Uz compinit && compinit -d "$zsh_cache_dir/zcompdump"

command -v starship &>/dev/null && eval "$(starship init zsh)"
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"
command -v fzf &>/dev/null && source <(fzf --zsh)

unset zsh_state_dir zsh_cache_dir

# マシン固有設定（credentials 等）
[[ -f "$ZDOTDIR/.zshrc.local" ]] && source "$ZDOTDIR/.zshrc.local"
