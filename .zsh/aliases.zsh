# general
alias share='python3 -m http.server 8000'
alias myip='curl -4 http://ifconfig.me; echo'

alias g='git'
alias gbd='git branch --merged | grep -v "\*" | grep -v "main" | grep -v "develop" | xargs -n 1 git branch -d'

alias mkdir='mkdir -p'

# cd
alias d='cd ~/Documents/'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# tool-specific
alias deit='docker exec -it'
alias dc='docker compose'
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:2.1.1'
