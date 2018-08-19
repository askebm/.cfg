execute pathogen#infect()
set encoding=utf-8
set number
set relativenumber
syntax enable
set hidden
set history=100
set wildmode=longest,list,full
set wildmenu
autocmd BufWritePre * %s/\s\+$//e
colorscheme 256-jungle
