let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='mupdf'
    let g:vimtex_quickfix_mode=0
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

" syntax and plugins
filetype plugin on
syntax on

set encoding=utf-8
set number relativenumber

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" F6 to open/close nerdtree
nnoremap <silent> <expr> <Tab> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Quit after opening file
let NERDTreeQuitOnOpen = 1

" close a tab if the only remaining window is NerdTree (also taken from the Readme):
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"tabs
set tabstop=4
set shiftwidth=4
set expandtab

":help clipboard
set clipboard+=unnamedplus

colorscheme afterglow
set scrolloff=10
