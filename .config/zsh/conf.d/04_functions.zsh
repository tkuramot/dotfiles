function gh() {
  if [[ "$1" == "cd" ]]; then
    local repo
    repo=$(ghq list | fzf)
    if [[ -n "$repo" ]]; then
      cd "$(ghq root)/$repo" || return
    fi
  else
    command gh "$@"
  fi
}
