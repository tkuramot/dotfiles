local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"

local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    "astro",
    "bashls",
    "biome",
    "clangd",
    "cmake",
    "cssls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "efm",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "pylsp",
    "rust_analyzer",
    "solidity_ls",
    "sqlls",
    "svelte",
    "tailwindcss",
    "tsserver",
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

    lspconfig.cssls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        css = { validate = true, lint = {
          unknownAtRules = "ignore",
        } },
        scss = { validate = true, lint = {
          unknownAtRules = "ignore",
        } },
        less = { validate = true, lint = {
          unknownAtRules = "ignore",
        } },
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

    lspconfig.solidity_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "solidity" },
      root_dir = lspconfig.util.find_git_ancestor,
      single_file_support = true,
    }

    local black = require "efmls-configs.formatters.black"
    local clangformat = require "efmls-configs.formatters.clang_format"
    local cpplint = require "efmls-configs.linters.cpplint"
    local eslint = require "efmls-configs.linters.eslint"
    local fixjson = require "efmls-configs.formatters.fixjson"
    local flake8 = require "efmls-configs.linters.flake8"
    local forge_fmt = require "efmls-configs.formatters.forge_fmt"
    local hadolint = require "efmls-configs.linters.hadolint"
    local jq = require "efmls-configs.formatters.jq"
    local luacheck = require "efmls-configs.linters.luacheck"
    local prettier_d = require "efmls-configs.formatters.prettier_d"
    local shellcheck = require "efmls-configs.linters.shellcheck"
    local shfmt = require "efmls-configs.formatters.shfmt"
    local solhint = require "efmls-configs.linters.solhint"
    local stylua = require "efmls-configs.formatters.stylua"

    -- configure efm server
    lspconfig.efm.setup {
      filetypes = {
        "c",
        "cpp",
        "css",
        "docker",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "python",
        "sh",
        "solidity",
        "svelte",
        "typescript",
        "typescriptreact",
        "vue",
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true,
      },
      settings = {
        languages = {
          astro = { prettier_d },
          solidity = { solhint, forge_fmt },
          lua = { luacheck, stylua },
          python = { flake8, black },
          typescript = { eslint, prettier_d },
          json = { jq, fixjson },
          sh = { shellcheck, shfmt },
          javascript = { eslint, prettier_d },
          javascriptreact = { eslint, prettier_d },
          typescriptreact = { eslint, prettier_d },
          svelte = { prettier_d },
          vue = { eslint, prettier_d },
          markdown = { prettier_d },
          docker = { hadolint, prettier_d },
          html = { prettier_d },
          css = { prettier_d },
          c = { clangformat, cpplint },
          cpp = { clangformat, cpplint },
        },
      },
    }
  end,
}
