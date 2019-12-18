let mapleader = "\<Space>"

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin()
    Plug 'scrooloose/nerdtree'
        let NERDTreeShowHidden=1

        " open a NERDTree automatically when vim starts up if no files were specified
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        " Tab to open/close nerdtree
        nnoremap <silent> <expr> <Tab> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

        " Quit after opening file
        let NERDTreeQuitOnOpen = 1

        " close a tab if the only remaining window is NerdTree (also taken from the Readme):
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

    Plug 'vim-airline/vim-airline'
        let g:airline#extensions#tabline#enabled = 1

    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
        let g:vim_markdown_folding_disabled = 1

    Plug 'jmcantrell/vim-virtualenv'
    Plug 'PieterjanMontens/vim-pipenv'

    Plug 'dense-analysis/ale'
        let g:ale_set_loclist = 1
        let g:ale_set_quickfix = 0
        let g:ale_open_list = 1
        let g:airline#extensions#ale#enabled = 1

        let g:ale_linters = {'python': ['pylama', 'pyflakes']}
        let g:ale_python_auto_pipenv = 1
        let g:ale_linters_explicit = 1

        "let g:ale_python_pylama_change_directory = 0
        "let g:ale_python_pylama_options = '-o ~/.config/pylama.ini'

    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
        "let g:pymode_lint_checkers = ['pylint']
        let g:pymode_options_max_line_length = 120
        let g:pymode_lint_on_write = 0
 
        let g:pymode_rope = 1
        let g:pymode_rope_lookup_project = 0
 
        let g:pymode_rope_show_doc_bind = '<leader>d'
        let g:pymode_rope_rename_bind = '<leader>rr'
        let g:pymode_rope_organize_imports_bind = '<leader>ro'
        let g:pymode_rope_rename_module_bind = '<leader>r1r'
        let g:pymode_rope_module_to_package_bind = '<leader>r1p'
        let g:pymode_rope_extract_method_bind = '<leader>rm'
        let g:pymode_rope_extract_variable_bind = '<leader>rl'
        let g:pymode_rope_use_function_bind = '<leader>ru'
        let g:pymode_rope_goto_definition_bind = '<leader>g'
        let g:pymode_rope_move_bind = '<leader>rv'
        let g:pymode_rope_change_signature_bind = '<leader>rs'

    Plug 'xolox/vim-misc'
    Plug 'yzy-1/vim-easytags'

    Plug 'majutsushi/tagbar'
        let g:tagbar_autoclose = 1
        let g:tagbar_autofocus = 1
        let g:tagbar_compact = 1
        nmap <leader>o :TagbarToggle<CR>
    
    Plug 'psf/black'
        let g:black_fast = 0
        let g:black_linelength = 120
        let g:black_skip_string_normalization = 1
        let g:black_virtualenv = '~/.local/share/venv/black'

    Plug 'tpope/vim-unimpaired'
call plug#end()

colorscheme afterglow

" syntax and plugins
filetype plugin on
syntax on

set encoding=utf-8
set number relativenumber

"tabs
set tabstop=4
set shiftwidth=4
set expandtab

":help clipboard
set clipboard+=unnamedplus

set scrolloff=10

" Buffers
nmap <PageUp>   :bp<CR>
nmap <PageDown> :bn<CR>
nmap <leader>x  :bw<CR>
nnoremap gb :ls<CR>:b<Space>

" Windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

set noswapfile
set cursorline
set colorcolumn=120

set ignorecase
set smartcase

autocmd BufWritePre *.py execute ':Black'
