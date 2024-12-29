local opt = vim.opt

opt.ambiwidth = 'double'

-- list
opt.list = true
opt.listchars = { tab = '>>', trail = '-', nbsp = '+' }

-- indent
opt.autoindent = true
opt.smartindent = true

-- highlight cursor line
opt.cursorline = true

-- tab
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- relative number
opt.relativenumber = true
opt.termguicolors = true
