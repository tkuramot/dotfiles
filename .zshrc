# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# zsh options
setopt correct
setopt auto_cd

# command completion
# autoload predict-on
# predict-on

# vim-like key bindings
bindkey -v

# utility functions
ggl() {
  local url="https://google.co.jp/search?q=${*// /+}"
  open $url
}

# general
alias vi=nvim
alias myip='echo -n "private ip: "; ifconfig en0 | grep -i mask | awk "{print \$2}"; echo -n "public ip: "; curl -4 http://ifconfig.me; echo'

alias l='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

# git
alias g='git'
alias gs='git status -s'
alias ga='git add'
alias gc='git commit'
alias gf='git fetch'
alias gl='git log'
alias gls='git log --stat'
alias gld='git log -p'
alias glo='git log --pretty=format:"%h - %an, %ar : %s"'
alias glg='git log --pretty=format:"%h %s" --graph'

# cd
alias d='cd ~/Documents/'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# cpp
alias actest='c++ -std=c++2b main.cpp && oj t -d ./tests'
alias cpp='c++ -std=c++2b'

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# cololize less man command
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
