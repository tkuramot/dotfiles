local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },

  { "42Paris/42header", lazy = false },

  -- coding support
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require "custom.configs.copilot"
    end,
    lazy = false,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "custom.configs.mason-lspconfig"
    end,
    dependencies = {
      "creativenull/efmls-configs-nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    lazy = false,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    lazy = false,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.hlchunk"
    end,
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup {}
      require("core.utils").load_mappings "treesj"
    end,
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- {
  --   "nmac427/guess-indent.nvim",
  --   config = function()
  --     require("guess-indent").setup {}
  --   end,
  --   lazy = false,
  -- },

  {
    "Diogo-ss/42-C-Formatter.nvim",
    cmd = "CFormat42",
    config = function()
      require("42-formatter").setup {
        formatter = "c_formatter_42",
        filetypes = { c = true, h = true, cpp = true, hpp = true },
      }
    end,
  },

  -- external tool integration
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup {}
    end,
    lazy = false,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {}
      require("core.utils").load_mappings "toggleterm"
    end,
    lazy = false,
  },

  -- disable nvchad's terminal plugin
  {
    "NvChad/nvterm",
    enabled = false,
  },

  -- ui
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "custom.configs.aerial"
      require("core.utils").load_mappings "aerial"
    end,
    lazy = false,
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup {}
    end,
    lazy = false,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {
        strict = true,
        override_by_extension = {
          astro = {
            icon = "",
            color = "#EF8547",
            name = "astro",
          },
        },
      }
    end,
  },

  -- session management
  {
    "jedrzejboczar/possession.nvim",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    config = function()
      require("telescope").load_extension "possession"
      require("core.utils").load_mappings "posession"
      require "custom.configs.possession"
    end,
    lazy = false,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
