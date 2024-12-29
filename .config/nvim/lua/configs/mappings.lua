local m = require('utils.mapping')

vim.g.mapleader = ' '

-- general
m.nmap('<LEADER>de', '<CMD>lua vim.diagnostic.open_float()<CR>', { desc = 'Open diagnostic float'})
m.nmap('<LEADER>dn', '<CMD>lua vim.diagnostic.goto_next()<CR>', { desc = 'Move to next diagnostic'})
m.nmap('<LEADER>dp', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Move to previous diagnostic'})

-- telescope
m.nmap('<LEADER>ff', '<CMD>Telescope smart_open<CR>', { desc = 'Find files (Telescope)' })
m.nmap('<LEADER>fg', '<CMD>Telescope live_grep<CR>', { desc = 'Grep files (Telescope)' })

-- oil
m.nmap('<LEADER>o', '<CMD>Oil<CR>', { desc = 'Browse file tree (Oil)' })

-- comment
m.vmap('<LEADER>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'Toggle comment' })
m.nmap('<LEADER>/', '<CMD>lua require("Comment.api").toggle.linewise()<CR>', { desc = 'Toggle comment' })

-- barbar
m.nmap('<LEADER>x', '<CMD>BufferClose<CR>', { desc = 'Close current buffer (Barbar)' })
m.nmap('<TAB>', '<CMD>BufferNext<CR>', { desc = 'Move to next buffer (Barbar)' })
m.nmap('<S-TAB>', '<CMD>BufferPrevious<CR>', { desc = 'Move to previous buffer (Barbar)' })

-- treesj
m.nmap('<LEADER>jt', '<cmd>lua require("treesj").toggle()<CR>', { desc = 'Toggle splitting and joining blocks (Treesj)' })

-- no neck pain
m.nmap('<LEADER>nt', '<CMD>NoNeckPain<CR>', { desc = 'Toggle NoNeckPain (NoNeckPain)' })

-- trouble
m.nmap("<LEADER>ttd", "<CMD>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics (Trouble)" })
m.nmap("<LEADER>ttD", "<CMD>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle buffer diagnostics (Trouble)" } )
