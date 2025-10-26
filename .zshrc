# export LANG=C

# zsh options
setopt correct
setopt auto_cd

export LANG=en_US.UTF-8

# command completion
# autoload predict-on
# predict-on

# vim-like key bindings
# bindkey -v

if [ -f ~/.zsh/aliases.zsh ]; then
  source ~/.zsh/aliases.zsh
fi

if [ -f ~/.zsh/environment.zsh ]; then
  source ~/.zsh/environment.zsh
fi

if [ -f ~/.zsh/credentials.zsh ]; then
  source ~/.zsh/credentials.zsh
fi

if [ -f ~/.zsh/functions.zsh ]; then
  source ~/.zsh/functions.zsh
fi

# tool related settings. e.g. starship, asdf, git-completion, etc.
if [ -f ~/.zsh/tools.zsh ]; then
  source ~/.zsh/tools.zsh
fi
