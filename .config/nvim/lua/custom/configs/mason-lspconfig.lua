local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"

local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function()
        return vim.loop.cwd()
      end,
    }

    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function()
        return vim.loop.cwd()
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }

    lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function()
        return vim.loop.cwd()
      end,
      settings = {
        javascript = {
          format = {
            baseIndentSize = 2,
            convertTabsToSpaces = true,
          },
        },
      },
    }
  end,
}
