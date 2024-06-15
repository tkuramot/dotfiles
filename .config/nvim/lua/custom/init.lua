-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match "warning: multiple different client offset_encodings" then
    return
  end

  notify(msg, ...)
end

-- 文字コード
vim.opt.encoding = "utf-8"
vim.lsp.encoding = "utf-8"

-- 不可視文字
vim.opt.expandtab = false
vim.opt.tabstop = 2 -- タブ文字の幅
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true -- 改行時のインデント継続
vim.opt.smartindent = true -- 改行時のインデントをいい感じに
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸-",
  trail = "-",
  space = "⋅",
  extends = "›",
  precedes = "‹",
  nbsp = "%",
}

-- 文字列検索
vim.opt.incsearch = true -- 文字入力毎に検索
vim.opt.ignorecase = true -- 大文字小文字を区別しない
vim.opt.smartcase = true -- 大文字を含んでいる場合は区別する
vim.opt.hlsearch = true -- 検索結果をハイライト
vim.opt.scrolloff = 10
