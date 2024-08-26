# general
alias vi=nvim
alias share='python3 -m http.server 8000'
alias myip='curl -4 http://ifconfig.me; echo'

alias l='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

alias g='git'
alias gbd='git branch --merged | grep -v "\*" | grep -v "main" | grep -v "develop" | xargs -n 1 git branch -d'

# cd
alias d='cd ~/Documents/'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:2.1.1'
