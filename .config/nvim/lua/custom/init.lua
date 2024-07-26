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
vim.opt.expandtab = true
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

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
}

vim.treesitter.language.register("markdown", "mdx")

function CopilotChatBuffer()
  local input = vim.fn.input "Quick Chat: "
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end

function ShowCopilotChatActionPrompt()
  local actions = require "CopilotChat.actions"
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end
