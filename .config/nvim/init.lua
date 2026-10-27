local opt = vim.opt
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name) return vim.api.nvim_create_augroup(name, { clear = true }) end

vim.g.mapleader = " "

-- UI
-- retrobox is a Vim colorscheme and leaves Nvim-only groups at generic defaults
-- (unreadable on light bg); derive them from its own palette instead.
autocmd("ColorScheme", {
  group = augroup("my.colorscheme"),
  pattern = "retrobox",
  callback = function()
    local fg = function(name) return vim.api.nvim_get_hl(0, { name = name, link = false }).fg end
    local hl = function(name, val) vim.api.nvim_set_hl(0, name, val) end
    hl("DiagnosticError", { fg = fg("Statement") })
    hl("DiagnosticWarn", { fg = fg("Type") })
    hl("DiagnosticInfo", { fg = fg("Identifier") })
    hl("DiagnosticHint", { fg = fg("PreProc") })
    hl("DiagnosticOk", { fg = fg("String") })
    hl("LspInlayHint", { link = "Comment" })
  end,
})
vim.cmd.colorscheme("retrobox")

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.foldlevel = 99 -- open all folds by default
opt.foldtext = "" -- keep syntax highlighting

-- Indent
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = -1

-- Search / substitute
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Editing
opt.undofile = true
opt.swapfile = false
opt.splitright = true
opt.splitbelow = true
opt.completeopt = { "menuone", "noselect", "popup" }

-- Keymaps
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", [[<C-\><C-n>]]) -- exit terminal mode
map("i", "jj", "<Esc>")

-- :find and :grep via rg
if vim.fn.executable("rg") == 1 then
  function _G.RgFindFiles(query, _)
    local files = vim.fn.systemlist({ "rg", "--files", "--hidden", "--glob", "!.git" })
    return query == "" and files or vim.fn.matchfuzzy(files, query)
  end

  opt.findfunc = "v:lua.RgFindFiles"
  opt.grepprg = "rg --vimgrep --smart-case"
end

-- netrw
vim.g.netrw_liststyle = 3

-- Diagnostics
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 2 },
  float = { border = "rounded", source = true },
})

-- LSP (server definitions live in lsp/<name>.lua)
vim.lsp.enable({ "lua_ls", "gopls", "clangd", "tsc", "sorbet", "ruby_lsp" })
vim.lsp.codelens.enable(true)

autocmd("LspAttach", {
  group = augroup("my.lsp.attach"),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf = args.buf

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end

    if client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldmethod = "expr"
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})

autocmd("BufWritePre", {
  group = augroup("my.lsp.format_on_save"),
  callback = function(args)
    if #vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" }) > 0 then
      vim.lsp.buf.format({ bufnr = args.buf })
    end
  end,
})

-- Autocommands
autocmd("BufReadPost", {
  group = augroup("my.restore_cursor"),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(args.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- experimental
require("vim._core.ui2").enable()
