local persisted = require "persisted"

-- https://github.com/olimorris/persisted.nvim?tab=readme-ov-file#wrench-configuration
persisted.setup {
  save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"),
  autoload = true, -- automatically load the session for the cwd on Neovim startup
}
