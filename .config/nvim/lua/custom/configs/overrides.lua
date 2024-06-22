local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "css",
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "bash-language-server",
    "clang-format",
    "clangd",
    "css-lsp",
    "gopls",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "prettier",
    "solargraph",
    "stylua",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  filters = {
    custom = {
      "^.git$",
    },
  },

  view = {
    width = "100%",
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
