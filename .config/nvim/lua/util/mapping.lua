local mapping = {}

-- keymap
for _, mode in pairs({ 'n', 'v', 'i', 's', 'o', 'c', 't', 'x' }) do
  mapping[mode .. 'map'] = function(lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts or { silent = true })
  end
end

return mapping
