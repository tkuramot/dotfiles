return {
  -- git
  {
    "tkuramot/go-to-pr.nvim",
    config = function()
      require("go-to-pr").setup()
    end
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 200,
        },
      })
    end
  },
  {
    "sindrets/diffview.nvim",
  },

  -- test
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "olimorris/neotest-rspec",
  --     "rouge8/neotest-rust",
  --   },
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-rspec"),
  --         require("neotest-rust")
  --       },
  --       output_panel = {
  --         enabled = true,
  --         open = 'botright vsplit | vertical resize 50',
  --       },
  --     })
  --   end
  -- },
  -- {
  --   "rest-nvim/rest.nvim",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-neotest/nvim-nio",
  --     opts = function(_, opts)
  --       opts.ensure_installed = opts.ensure_installed or {}
  --       table.insert(opts.ensure_installed, "http")
  --     end,
  --   }
  -- },

  -- search
  {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require('oil').setup()
    end
  },
  {
    'kevinhwang91/nvim-bqf',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = 'flex',
          layout_config = {
            prompt_position = 'top'
          },
          sorting_strategy = 'ascending',
        }
      })
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
      modes = {
        symbols = {
          win = { position = 'right', size = 0.25 },
        },
      },
    },
    cmd = "Trouble",
  },

  -- remote
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- coding
  {
    "OXY2DEV/foldtext.nvim",
    lazy = false
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false,
  --   opts = {
  --     highlights = {
  --       diff = {
  --         current = "ConflictCurrent",
  --         incoming = "ConflictIncoming",
  --       }
  --     }
  --   },
  --   build = "make",
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "echasnovski/mini.pick",         -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",              -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons",
  --     {
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --         code = {
  --           border = 'none',
  --           disable_background = true
  --         }
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("avante").setup(opts)
  --   end
  -- },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
        },
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = {
        basic = false,
        extra = false,
      },
    },
  },
  -- NOTE: auto-pair plugins are not working well with blink.cmp signature help
  -- {
  --   'windwp/nvim-autopairs',
  --   event = "InsertEnter",
  --   config = true
  -- },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  },

  --highlight
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('hlchunk').setup {
        chunk = {
          enable = true,
          delay = 50,
        }
      }
    end,
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'VeryLazy' },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'printf',
        'python',
        'query',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  -- completion
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.6.0',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod', 'lazydev' },
        providers = {
          lsp = {
            name = 'lsp',
            module = 'blink.cmp.sources.lsp',
            score_offset = 1000,
          },
          snippets = {
            name = 'lsp',
            module = 'blink.cmp.sources.snippets',
            score_offset = 900,
          },
          buffer = {
            name = 'buffer',
            module = 'blink.cmp.sources.buffer',
            score_offset = 800,
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
            score_offset = 950,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
      },
      signature = {
        enabled = true
      },
    },
  },

  -- lsp
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        outline = {
          win_width = 40,
          win_position = 'left',
          detail = false,
        },
        lightbulb = {
          sign = false,
        },
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        automatic_installation = false,
        automatic_enable = true,
        ensure_installed = {
          'lua_ls',
          'ruby_lsp',
          'rust_analyzer',
          'ts_ls',
          'typos_lsp',
          'yamlls'
        }
      })
      require('mason-lspconfig').setup()
    end
  },

  -- formatter
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local mason_package = require("mason-core.package")
      local mason_registry = require("mason-registry")
      local null_ls = require("null-ls")

      local null_sources = {
        -- NOTE: suppress failed to load builtin eslint_d for method diagnostics warning
        require("none-ls.diagnostics.eslint_d"),
      }

      for _, package in ipairs(mason_registry.get_installed_packages()) do
        local package_categories = package.spec.categories[1]
        if package_categories == mason_package.Cat.Formatter then
          table.insert(null_sources, null_ls.builtins.formatting[package.name])
        end
        if package_categories == mason_package.Cat.Linter then
          -- NOTE: suppress failed to load builtin eslint_d for method diagnostics warning
          if package.name ~= "eslint_d" then
            table.insert(null_sources, null_ls.builtins.diagnostics[package.name])
          end
        end
      end

      null_ls.setup({
        sources = null_sources,
      })
    end
  },

  -- status
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({})
    end
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    version = '1.9.1',
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require('fidget').setup({})
    end
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require('fidget').setup({})
    end
  },

  -- theme
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(_, _)
        local groups = {
          ConflictCurrent = { bg = '#adeae5' },
          ConflictIncoming = { bg = '#cee6f6' }
        }
        return groups
      end
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'light'
      require('solarized').setup(opts)
      vim.cmd.colorscheme 'solarized'
    end,
  },

  -- misc
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon').setup()
    end
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({
        enable_tailwind = true,
      })
    end
  },
  {
    'direnv/direnv.vim',
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  }
}
