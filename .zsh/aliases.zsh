# general
alias share='python3 -m http.server 8000'
alias myip='curl -4 http://ifconfig.me; echo'
alias n='nvim'

alias g='git'
alias gbd='git branch --merged | grep -v "\*" | grep -v "main" | grep -v "develop" | xargs -n 1 git branch -d'

# cd
alias d='cd ~/Documents/'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# tool-specific
alias deit='docker exec -it'
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:2.1.1'

alias rails='docker compose exec backend ./bin/rails'
alias rspec='docker compose exec backend ./bin/rspec'
