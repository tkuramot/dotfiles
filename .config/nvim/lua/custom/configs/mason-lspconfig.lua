local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"

local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "bashls",
    "biome",
    "clangd",
    "cmake",
    "cssls",
    "denols",
    "dockerls",
    "docker_compose_language_service",
    "gopls",
    "html",
    "jsonls",
    "tsserver",
    "marksman",
    "pylsp",
    "rust_analyzer",
    "solidity_ls",
    "sqlls",
  },
  automatic_install = true,
}
mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.gopls.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
      end,
      settings = {
        gopls = {
          analyses = {
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          experimentalPostfixCompletions = true,
          gofumpt = true,
          staticcheck = true,
          usePlaceholders = true,
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
    }

    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
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
      root_dir = lspconfig.util.root_pattern "package.json",
      settings = {
        javascript = {
          format = {
            baseIndentSize = 2,
            convertTabsToSpaces = true,
          },
        },
      },
    }

    lspconfig.denols.setup {
      root_dir = lspconfig.util.root_pattern "deno.json",
      init_options = {
        lint = true,
        unstable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://deno.land"] = true,
              ["https://cdn.nest.land"] = true,
              ["https://crux.land"] = true,
            },
          },
        },
      },
    }

    lspconfig.pylsp.setup {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 100,
            },
            pylsp_black = {
              enabled = true,
              line_length = 100,
            },
          },
        },
      },
    }

    lspconfig.rust_analyzer.setup {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
        },
      },
      on_attach = on_attach,
    }
  end,
}
