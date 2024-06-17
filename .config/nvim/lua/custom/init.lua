-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

require "custom.autocmds"

-- input
vim.opt.encoding = "utf-8"
vim.lsp.encoding = "utf-8"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true

-- list
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸-",
  trail = "-",
  space = "⋅",
  extends = "›",
  precedes = "‹",
  nbsp = "%",
}

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 10
