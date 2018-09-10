set encoding=utf-8
set number
set relativenumber
syntax enable
set hidden
set history=100
set wildmode=longest,list,full
set wildmenu
autocmd BufWritePre * %s/\s\+$//e
let g:livepreview_previewer = '$HOME/.vim/scripts/mupdf.inotify'
let g:ale_completion_enabled = 1
filetype plugin on

" Clang_complete "
let g:clang_library_path='/usr/lib'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
