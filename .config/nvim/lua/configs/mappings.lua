local m = require('utils.mapping')

vim.g.mapleader = ' '

-- telescope
m.nmap('<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
m.nmap('<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Grep files' })

-- nvim-tree
m.nmap('<leader>tf', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })

-- comment
m.vmap('<leader>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'Toggle comment' })
m.nmap('<leader>/', '<CMD>lua require("Comment.api").toggle.linewise()<CR>', { desc = 'Toggle comment' })

-- barbar
m.nmap('<leader>x', '<cmd>BufferClose<CR>', { desc = 'Close current buffer' })
m.nmap('<tab>', '<cmd>BufferNext<CR>', { desc = 'Move to next buffer' })
m.nmap('<s-tab>', '<cmd>BufferPrevious<CR>', { desc = 'Move to previous buffer' })

-- treesj
m.nmap('<leader>ts', 'require("treesj").toggle()', { desc = 'Toggle splitting blocks' })

-- aerial
m.nmap('<leader>ts', '<cmd>AerialToggle<CR>', { desc = 'Toggle symbol tree' })
