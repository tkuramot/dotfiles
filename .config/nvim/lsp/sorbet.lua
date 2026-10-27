return {
  -- srb reads sorbet/config from cwd, which differs from root_dir in monorepos
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ "bundle", "exec", "srb", "tc", "--lsp" }, dispatchers, { cwd = config.root_dir })
  end,
  filetypes = { "ruby" },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, "Gemfile")
    if root and vim.uv.fs_stat(root .. "/sorbet/config") then on_dir(root) end
  end,
}
