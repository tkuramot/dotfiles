local m = require('utils.mapping')

vim.g.mapleader = ' '

-- telescope
m.nmap('<leader>ff', '<cmd>Telescope smart_open<CR>', { desc = 'Find files' })
m.nmap('<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Grep files' })

-- oil
m.nmap('<leader>tf', '<cmd>Oil<CR>', { desc = 'Open file tree' })

-- comment
m.vmap('<leader>/', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'Toggle comment' })
m.nmap('<leader>/', '<cmd>lua require("Comment.api").toggle.linewise()<CR>', { desc = 'Toggle comment' })

-- barbar
m.nmap('<leader>x', '<cmd>BufferClose<CR>', { desc = 'Close current buffer' })
m.nmap('<tab>', '<cmd>BufferNext<CR>', { desc = 'Move to next buffer' })
m.nmap('<s-tab>', '<cmd>BufferPrevious<CR>', { desc = 'Move to previous buffer' })

-- treesj
m.nmap('<leader>tj', '<cmd>lua require("treesj").toggle()<CR>', { desc = 'Toggle splitting and joining blocks' })

-- sidebar
m.nmap('<leader>ts', '<cmd>SidebarNvimToggle<CR>', { desc = 'Toggle sidebar' })

-- any jump
m.nmap('<leader>aj', '<cmd>AnyJump<CR>', { desc = 'Jump to definition' })
m.vmap('<leader>aj', '<cmd>AnyJumpVisual<CR>', { desc = 'Jump to definition' })
m.nmap('<leader>ab', '<cmd>AnyJumpBack<CR>', { desc = 'Open previous opend file' })
m.nmap('<leader>al', '<cmd>AnyJumpLastResults<CR>', { desc = 'Open last closed search window' })

-- no neck pain
m.nmap('<leader>tn', '<cmd>NoNeckPain<CR>', { desc = 'Toggle no neck pain' })
