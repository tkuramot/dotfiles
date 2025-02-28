" automatically convert to hex on read and write
autocmd BufReadPost * if &binary | execute '%!xxd' | setlocal filetype=xxd | setlocal syntax=xxd | endif
autocmd BufWritePre * if &binary | execute '%!xxd -r' | endif
autocmd BufWritePost * if &binary | execute '%!xxd' | endif

" theme https://github.com/lifepillar/vim-solarized8
set background=light
colorscheme solarized8_flat

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" visual
syntax on
set showmatch
set number
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2

" misc
set laststatus=2
set encoding=utf-8
filetype plugin indent on
