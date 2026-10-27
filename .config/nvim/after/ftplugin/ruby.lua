-- ftplugin/ruby.vim's tag maps use :tag, so vim.lsp.tagfunc falls back to workspace/symbol
for _, lhs in ipairs({ "<C-]>", "g<C-]>", "g]", "<C-W>]", "<C-W><C-]>", "<C-W>g<C-]>", "<C-W>g]", "<C-W>}", "<C-W>g}" }) do
  pcall(vim.keymap.del, "n", lhs, { buffer = 0 })
end
