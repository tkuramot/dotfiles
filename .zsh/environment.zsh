export EDITOR=vim

# cololize man command
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export PATH=~/.asdf/shims/:~/bin/:$PATH
export PATH=~/.local/share/mise/installs/:~/bin/:$PATH
export PATH=$PATH:~/.local/bin/

if [ uname = "Linux" ]; then
  # run update-desktop-database for snap apps to show up in the menu
  export XDG_DATA_DIR=$XDG_DATA_DIR:/var/lib/snapd/desktop/applications/
fi

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
