local m = require('util.mapping')

vim.g.mapleader = ' '

-- general
m.imap('<C-W><C-W>', '<ESC>', { desc = 'Exit insert mode' })
m.tmap('<C-W><C-W>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
m.nmap('<LEADER>fm', '<CMD>lua vim.lsp.buf.format()<CR>', { desc = 'Format file' })
m.nmap('<LEADER>tn', '<CMD>tabnew<CR>', { desc = 'New tab' })
m.nmap('<LEADER>tl', '<CMD>tabnext<CR>', { desc = 'Next tab' })
m.nmap('<LEADER>th', '<CMD>tabprevious<CR>', { desc = 'Previous tab' })
m.nmap('<LEADER>tc', '<CMD>tabclose<CR>', { desc = 'Close tab' })
m.nmap('<LEADER>dd', function() vim.diagnostic.open_float() end, { desc = 'Open diagnostic float' })

-- git
m.nmap('<LEADER>g', '<CMD>LazyGit<CR>', { desc = 'Open lazygit' })
m.nmap('<LEADER>pb', function() require("go-to-pr").blame_pr() end, { desc = 'Blame PR' })
m.nmap('<LEADER>po', function() require("go-to-pr").open_pr() end, { desc = 'Open/Create PR' })

-- copilot
m.imap('<S-TAB>', function() require("copilot.suggestion").accept() end, { desc = 'Accept copilot suggestion' })

-- claudecode
m.nmap('<LEADER>ac', '<CMD>ClaudeCode<CR>', { desc = 'Toggle Claude' })
m.nmap('<LEADER>af', '<CMD>ClaudeCodeFocus<CR>', { desc = 'Focus Claude' })
m.nmap('<LEADER>ar', '<CMD>ClaudeCode --resume<CR>', { desc = 'Resume Claude' })
m.nmap('<LEADER>aC', '<CMD>ClaudeCode --continue<CR>', { desc = 'Continue Claude' })
m.nmap('<LEADER>am', '<CMD>ClaudeCodeSelectModel<CR>', { desc = 'Select Claude Model' })
m.nmap('<LEADER>ab', '<CMD>ClaudeCodeAdd %<CR>', { desc = 'Add current buffer' })
m.vmap('<LEADER>as', '<CMD>ClaudeCodeSend<CR>', { desc = 'Send to buffer' })
m.nmap('<LEADER>aa', '<CMD>ClaudeCodeDiffAccept<CR>', { desc = 'Accept diff' })
m.nmap('<LEADER>ad', '<CMD>ClaudeCodeDiffDeny<CR>', { desc = 'Deny diff' })
m.nmap('<LEADER>as', '<CMD>ClaudeCodeTreeAdd<CR>', { desc = 'Add files' }, { ft = { 'oil' } })

-- lspsaga
m.nmap('<LEADER>la', '<CMD>Lspsaga code_action<CR>', { desc = 'Code action' })
m.nmap('<LEADER>lD', '<CMD>Lspsaga hover_doc<CR>', { desc = 'Hover doc' })
m.nmap('<LEADER>lf', '<CMD>Lspsaga finder<CR>', { desc = 'Lsp finder' })
m.nmap('<LEADER>lr', '<CMD>Lspsaga rename<CR>', { desc = 'Rename' })
m.nmap('gd', '<CMD>Lspsaga goto_definition<CR>', { desc = 'Goto definition' })

-- telescope
m.nmap('<LEADER>ff', '<CMD>Telescope smart_open<CR>', { desc = 'Find files' })
m.nmap('<LEADER>fg', '<CMD>Telescope live_grep<CR>', { desc = 'Grep files' })

-- oil
m.nmap('<LEADER>o', '<CMD>Oil<CR>', { desc = 'Browse file tree' })

-- comment
m.vmap('<LEADER>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { desc = 'Toggle comment' })
m.nmap('<LEADER>/', function() require("Comment.api").toggle.linewise() end, { desc = 'Toggle comment' })

-- barbar
m.nmap('<LEADER>x', '<CMD>BufferClose<CR>', { desc = 'Close current buffer' })
m.nmap('<TAB>', '<CMD>BufferNext<CR>', { desc = 'Move to next buffer' })
m.nmap('<S-TAB>', '<CMD>BufferPrevious<CR>', { desc = 'Move to previous buffer' })

-- nvim-treesitter-context
m.nmap('[c', function() require("treesitter-context").go_to_context(vim.v.count1) end, { desc = 'Go to upward context' })

-- treesj
m.nmap('<LEADER>jt', function() require("treesj").toggle() end, { desc = 'Toggle splitting and joining blocks' })

-- trouble
m.nmap("<LEADER>dg", "<CMD>Trouble diagnostics toggle<cr>", { desc = "Toggle workspace diagnostics" })
m.nmap("<LEADER>dl", "<CMD>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle buffer diagnostics" })
m.nmap("<LEADER>do", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Toggle workspace symbols" })

-- dbui
m.nmap("<LEADER>db", "<CMD>DBUIToggle<CR>", { desc = "Toggle DBUI" })

-- diffview
m.nmap("<LEADER>dvo", "<CMD>DiffviewFileHistory %<CR>", { desc = "Open diffview file history" })
m.nmap("<LEADER>dvc", "<CMD>DiffviewClose<CR>", { desc = "Close diffview" })

-- persistence
m.nmap("<LEADER>qs", function() require('persistence').load() end, { desc = "Load session" })
m.nmap("<LEADER>qS", function() require('persistence').select() end, { desc = "Select session" })
m.nmap("<LEADER>qd", function() require('persistence').stop() end, { desc = "Stop persistence" })
m.nmap("<LEADER>ql", function() require('persistence').load({ last = true }) end, { desc = "Load last session" })
