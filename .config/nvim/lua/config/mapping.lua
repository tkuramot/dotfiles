local m = require('util.mapping')

vim.g.mapleader = ' '

-- general
m.imap('jj', '<ESC>', { desc = 'Exit insert mode' })
m.nmap('<LEADER>fm', '<CMD>lua vim.lsp.buf.format()<CR>', { desc = 'Format file' })

-- git
m.nmap('<LEADER>g', '<CMD>LazyGit<CR>', { desc = 'Open lazygit' })

-- copilot
m.imap('<TAB>', '<CMD>lua require("copilot.suggestion").accept()<CR>', { desc = 'Accept copilot suggestion' })

-- lspsaga
m.nmap('<LEADER>la', '<CMD>Lspsaga code_action<CR>', { desc = 'Code action' })
m.nmap('<LEADER>lD', '<CMD>Lspsaga hover_doc<CR>', { desc = 'Hover doc' })
m.nmap('<LEADER>lf', '<CMD>Lspsaga finder<CR>', { desc = 'Lsp finder' })
m.nmap('<LEADER>lr', '<CMD>Lspsaga rename<CR>', { desc = 'Rename' })
m.nmap('<LEADER>ld', '<CMD>Lspsaga show_line_diagnostics<CR>', { desc = 'Show line diagnostics' })
m.nmap('gd', '<CMD>Lspsaga goto_definition<CR>', { desc = 'Goto definition' })

-- telescope
m.nmap('<LEADER>ff', '<CMD>Telescope smart_open<CR>', { desc = 'Find files' })
m.nmap('<LEADER>fg', '<CMD>Telescope live_grep<CR>', { desc = 'Grep files' })

-- oil
m.nmap('<LEADER>o', '<CMD>Oil<CR>', { desc = 'Browse file tree' })

-- comment
m.vmap('<LEADER>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { desc = 'Toggle comment' })
m.nmap('<LEADER>/', '<CMD>lua require("Comment.api").toggle.linewise()<CR>', { desc = 'Toggle comment' })

-- barbar
m.nmap('<LEADER>x', '<CMD>BufferClose<CR>', { desc = 'Close current buffer' })
m.nmap('<TAB>', '<CMD>BufferNext<CR>', { desc = 'Move to next buffer' })
m.nmap('<S-TAB>', '<CMD>BufferPrevious<CR>', { desc = 'Move to previous buffer' })

-- nvim-treesitter-context
m.nmap('[c', function() require("treesitter-context").go_to_context(vim.v.count1) end, { desc = 'Go to upward context' })

-- treesj
m.nmap('<LEADER>jt', '<cmd>lua require("treesj").toggle()<CR>', { desc = 'Toggle splitting and joining blocks' })

-- no neck pain
m.nmap('<LEADER>nt', '<CMD>NoNeckPain<CR>', { desc = 'Toggle NoNeckPain' })

-- neotest
m.nmap('<LEADER>tf', '<CMD>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { desc = 'Run test file' })
m.nmap('<LEADER>tn', '<CMD>lua require("neotest").run.run()<CR>', { desc = 'Run test nearest' })
m.nmap('<LEADER>ts', '<CMD>Neotest summary<CR>', { desc = 'Show test summary' })
m.nmap('<LEADER>to', '<CMD>Neotest output-panel<CR>', { desc = 'Show test output' })

-- trouble
m.nmap("<LEADER>dg", "<CMD>Trouble diagnostics toggle<cr>", { desc = "Toggle workspace diagnostics" })
m.nmap("<LEADER>dl", "<CMD>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle buffer diagnostics" })

-- dbui
m.nmap("<LEADER>db", "<CMD>DBUIToggle<CR>", { desc = "Toggle DBUI" })

-- diffview
m.nmap("<LEADER>dvo", "<CMD>DiffviewFileHistory %<CR>", { desc = "Open diffview file history" })
m.nmap("<LEADER>dvc", "<CMD>DiffviewClose<CR>", { desc = "Close diffview" })
