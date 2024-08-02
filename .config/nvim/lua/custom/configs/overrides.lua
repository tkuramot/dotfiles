local M = {}

M.treesitter = {
  ensure_installed = {
    "astro",
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "svelte",
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
    "black",
    "goimports",
    "isort",
    "prettierd",
    "solargraph",
    "solhint",
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
