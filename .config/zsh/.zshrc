# conf.d/ 以下を番号順に読み込む
for f in "$ZDOTDIR"/conf.d/*.zsh(N); do
  source "$f"
done

# マシン固有設定（credentials 等）
[[ -f "$ZDOTDIR/.zshrc.local" ]] && source "$ZDOTDIR/.zshrc.local"
