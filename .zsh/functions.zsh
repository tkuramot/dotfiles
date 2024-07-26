# utility functions
ggl() {
  local url="https://google.co.jp/search?q=${*// /+}"
  open $url
}

