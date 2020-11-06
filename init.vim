"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin()
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'machakann/vim-sandwich'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-sleuth'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
if s:mode ==? "dark"
    set background=dark
    colorscheme palenight
else
    set background=light
    colorscheme gruvbox
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:palenight_terminal_italics=1

" CoC config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = 'sp'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" NerdTree config
" Open NerdTree on editor startup
" if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close the editor if NerdTree
" is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>

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

filetype plugin on
syntax on

let &colorcolumn=120

command! Reload source $HOME/.config/nvim/init.vim
