require ('base')
require ('configs.mappings')

-- plugins
require('configs.lazy')

-- restore cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 1 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, {last_pos, vim.fn.col("'\"")})
      vim.cmd("normal! zz")
    end
  end,
})
