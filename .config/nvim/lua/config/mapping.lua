local m = require('util.mapping')

vim.g.mapleader = ' '

-- general
m.imap('jj', '<ESC>', { desc = 'Exit insert mode' })
m.nmap('<LEADER>de', '<CMD>lua vim.diagnostic.open_float()<CR>', { desc = 'Open diagnostic float' })
m.nmap('<LEADER>dn', '<CMD>lua vim.diagnostic.goto_next()<CR>', { desc = 'Move to next diagnostic' })
m.nmap('<LEADER>dp', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Move to previous diagnostic' })
m.nmap('<LEADER>fm', '<CMD>lua vim.lsp.buf.format()<CR>', { desc = 'Format file' })

-- git
m.nmap('<LEADER>g', '<CMD>LazyGit<CR>', { desc = 'Open lazygit' })

-- copilot
m.imap('<TAB>', '<CMD>lua require("copilot.suggestion").accept()<CR>', { desc = 'Accept copilot suggestion' })

-- lspsaga
m.nmap('<LEADER>la', '<CMD>Lspsaga code_action<CR>', { desc = 'Code action' })
m.nmap('<LEADER>ld', '<CMD>Lspsaga hover_doc<CR>', { desc = 'Hover doc' })
m.nmap('<LEADER>lf', '<CMD>Lspsaga finder<CR>', { desc = 'Lsp finder' })
m.nmap('<LEADER>lr', '<CMD>Lspsaga rename<CR>', { desc = 'Rename' })
m.nmap('gd', '<CMD>Lspsaga goto_definition<CR>', { desc = 'Goto definition' })

-- telescope
m.nmap('<LEADER>ff', '<CMD>Telescope smart_open<CR>', { desc = 'Find files' })
m.nmap('<LEADER>fg', '<CMD>Telescope live_grep<CR>', { desc = 'Grep files' })

-- oil
m.nmap('<LEADER>o', '<CMD>Oil<CR>', { desc = 'Browse file tree' })

-- comment
m.vmap('<LEADER>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { desc = 'Toggle comment' })
m.nmap('<LEADER>/', '<CMD>lua require("Comment.api").toggle.linewise()<CR>', { desc = 'Toggle comment' })

-- barbar
m.nmap('<LEADER>x', '<CMD>BufferClose<CR>', { desc = 'Close current buffer' })
m.nmap('<TAB>', '<CMD>BufferNext<CR>', { desc = 'Move to next buffer' })
m.nmap('<S-TAB>', '<CMD>BufferPrevious<CR>', { desc = 'Move to previous buffer' })

-- treesj
m.nmap('<LEADER>jt', '<cmd>lua require("treesj").toggle()<CR>', { desc = 'Toggle splitting and joining blocks' })

-- no neck pain
m.nmap('<LEADER>nt', '<CMD>NoNeckPain<CR>', { desc = 'Toggle NoNeckPain' })

-- trouble
m.nmap("<LEADER>td", "<CMD>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics" })
m.nmap("<LEADER>tD", "<CMD>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle buffer diagnostics" })
