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

# pnpm
export PNPM_HOME="/Users/kura/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kura/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kura/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kura/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kura/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
