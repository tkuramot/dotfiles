-- Reuse the running client for stdlib / module cache files instead of spawning one per module
-- see: https://github.com/neovim/nvim-lspconfig/issues/804
local go_env = vim.fn.systemlist({ "go", "env", "GOROOT", "GOMODCACHE" })
local external_dirs = vim.v.shell_error == 0 and { go_env[1] .. "/src", go_env[2] } or {}

return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local client = vim.lsp.get_clients({ name = "gopls" })[1]
    if client and vim.iter(external_dirs):any(function(dir) return vim.startswith(fname, dir) end) then
      return on_dir(client.root_dir)
    end
    on_dir(vim.fs.root(fname, { "go.work", "go.mod", ".git" }))
  end,
  settings = {
    gopls = {
      semanticTokens = true,
      staticcheck = true,
      usePlaceholders = true,
      analyses = { unusedparams = true },
      codelenses = { test = true },
    },
  },
}
