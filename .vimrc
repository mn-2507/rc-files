" Load all plugins now
packloadall
silent! helptags ALL

" Always wrap long lines
set wrap
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave  * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter    * set norelativenumber
augroup END

set autoindent
set smartindent

syntax on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

let &colorcolumn=120
highlight Normal ctermfg=Grey ctermbg=233
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

let mapleader = ","
let maplocalleader = "\\"

nnoremap <leader>- ddp
nnoremap <leader>_ dd2k^p
nnoremap <leader>c ddO

nnoremap <leader><c-u> viwU
inoremap <leader><c-u> <esc>vbUea

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>evh :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
