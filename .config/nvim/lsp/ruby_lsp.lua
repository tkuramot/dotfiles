return {
  -- ruby-lsp resolves the bundle from cwd, which differs from root_dir in monorepos
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ "ruby-lsp" }, dispatchers, { cwd = config.root_dir })
  end,
  filetypes = { "ruby", "eruby" },
  root_markers = { "Gemfile", ".git" },
}
