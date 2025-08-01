local m = require('util.mapping')

vim.g.mapleader = ' '

-- general
m.imap('jj', '<ESC>', { desc = 'Exit insert mode' })
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
m.imap('<TAB>', function() require("copilot.suggestion").accept() end, { desc = 'Accept copilot suggestion' })

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

-- no neck pain
m.nmap('<LEADER>nt', '<CMD>NoNeckPain<CR>', { desc = 'Toggle NoNeckPain' })

-- neotest
m.nmap('<LEADER>tf', function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = 'Run test file' })
m.nmap('<LEADER>tt', function() require("neotest").run.run() end, { desc = 'Run test nearest' })
m.nmap('<LEADER>ts', '<CMD>Neotest summary<CR>', { desc = 'Show test summary' })
m.nmap('<LEADER>to', '<CMD>Neotest output-panel<CR>', { desc = 'Show test output' })

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
m.nmap("<LEADER>qs", function () require('persistence').load() end, { desc = "Load session" })
m.nmap("<LEADER>qS", function () require('persistence').select() end, { desc = "Select session" })
m.nmap("<LEADER>qd", function () require('persistence').stop() end, { desc = "Stop persistence" })
m.nmap("<LEADER>ql", function () require('persistence').load({ last = true }) end, { desc = "Load last session" })
