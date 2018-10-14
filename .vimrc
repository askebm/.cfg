set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set number
set relativenumber
syntax enable
set hidden
set history=100
set wildmode=longest,list,full
set wildmenu
let g:livepreview_previewer = '$HOME/.vim/scripts/mupdf.inotify'
let g:ale_completion_enabled = 1

" Set UltiSnip Directory
let g:UltiSnipsSnippetDirectories=["UltiSnips", "myUltiSnips"]

" Define where slime sends output
let g:slime_target = "vimterminal"

" Define leader key
let mapleader= ","
set showcmd
" Set default latex type
let g:tex_flavor = "latex"
" Disable warnings about missing clientserver, since none is available
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Clang_complete "
let g:clang_library_path='/usr/lib'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
