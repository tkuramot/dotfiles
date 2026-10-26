local opt = vim.opt
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name) return vim.api.nvim_create_augroup(name, { clear = true }) end

vim.g.mapleader = " "

-- UI
vim.cmd.colorscheme('retrobox')

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.foldlevel = 99 -- open all folds by default

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

-- Diagnostics
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 2 },
  float = { border = "rounded", source = true },
})

-- LSP
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME }, -- recognize `vim` and its API
      },
    },
  },
})

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      usePlaceholders = true,
      analyses = { unusedparams = true },
      codelenses = { test = true },
    },
  },
})
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".clang-format", ".git" },
})
vim.lsp.enable({ "lua_ls", "gopls", "clangd" })
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
