let mapleader = "\<Space>"

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin()
    Plug 'farmergreg/vim-lastplace'

    Plug 'ctrlpvim/ctrlp.vim'
        let g:ctrlp_map = '<c-p>'
        " Ignore files in .gitignore
        let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

    Plug 'easymotion/vim-easymotion'
    Plug 'chaoren/vim-wordmotion'

    Plug 'sirtaj/vim-openscad'
    Plug 'tpope/vim-fugitive'
        " Fugitive Conflict Resolution
        nnoremap <leader>gd :Gvdiffsplit!<CR>
        nnoremap gdh :diffget //2<CR>
        nnoremap gdl :diffget //3<CR>
    Plug 'idanarye/vim-merginal'

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
    Plug 'arcticicestudio/nord-vim'

    Plug 'vim-airline/vim-airline'
        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled = 1
        " Show just the filename
        let g:airline#extensions#tabline#fnamemod = ':t'

    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
        let g:vim_markdown_folding_disabled = 1

"   Plug 'jmcantrell/vim-virtualenv'
"   Plug 'PieterjanMontens/vim-pipenv'

    Plug 'dense-analysis/ale'
        let g:ale_set_loclist = 1
        let g:ale_set_quickfix = 0
        let g:ale_open_list = 0
        let g:airline#extensions#ale#enabled = 1
        let g:ale_list_window_size = 5

        let g:ale_linters = {'python': ['pylama', 'pyflakes']}
        let g:ale_python_auto_pipenv = 1
        let g:ale_linters_explicit = 1

        "let g:ale_python_pylama_change_directory = 0
        "let g:ale_python_pylama_options = '-o ~/.config/pylama.ini'

    Plug 'Valloric/ListToggle'
        let g:lt_location_list_toggle_map = '<leader>l'
        let g:lt_quickfix_list_toggle_map = '<leader>q'
        let g:lt_height = 10

    Plug 'davidhalter/jedi-vim'

    "Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    "    "let g:pymode_lint_checkers = ['pylint']
    "    let g:pymode_options_max_line_length = 88
    "    let g:pymode_lint_on_write = 0
 
    "    let g:pymode_rope = 0
    "    let g:pymode_rope_lookup_project = 0
    "    let g:pymode_rope_completion = 0
 
    "    let g:pymode_rope_show_doc_bind = '<leader>d'
    "    let g:pymode_rope_rename_bind = '<leader>rr'
    "    let g:pymode_rope_organize_imports_bind = '<leader>ro'
    "    let g:pymode_rope_rename_module_bind = '<leader>r1r'
    "    let g:pymode_rope_module_to_package_bind = '<leader>r1p'
    "    let g:pymode_rope_extract_method_bind = '<leader>rm'
    "    let g:pymode_rope_extract_variable_bind = '<leader>rl'
    "    let g:pymode_rope_use_function_bind = '<leader>ru'
    "    let g:pymode_rope_goto_definition_bind = '<leader>g'
    "    let g:pymode_rope_move_bind = '<leader>rv'
    "    let g:pymode_rope_change_signature_bind = '<leader>rs'

    Plug 'xolox/vim-misc'
    Plug 'yzy-1/vim-easytags'

    Plug 'vimwiki/vimwiki'

    Plug 'majutsushi/tagbar'
        let g:tagbar_autoclose = 1
        let g:tagbar_autofocus = 1
        let g:tagbar_compact = 1
        nmap <leader>o :TagbarToggle<CR>
    
    Plug 'psf/black', { 'for': 'python' }
        let g:black_fast = 1
        let g:black_virtualenv = '~/.local/share/virtualenvs/black'
    Plug 'fisadev/vim-isort', { 'for': 'python' }

    Plug 'tpope/vim-unimpaired'
"
"   Plug 'brooth/far.vim'
"       set lazyredraw
"       set regexpengine=1

    Plug 'junegunn/vim-easy-align'
        " Start interactive EasyAlign in visual mode (e.g. vipga)
		xmap ga <Plug>(EasyAlign)
		" Start interactive EasyAlign for a motion/text object (e.g. gaip)
		nmap ga <Plug>(EasyAlign)<Paste>

    Plug 'xolox/vim-session'
        let g:session_autosave = 'yes'
        let g:session_autoload = 'yes'
        let g:session_default_to_last = 'yes'

    Plug 'dbeniamine/todo.txt-vim'
        " Use todo#complete as the omni complete function for todo files
        au filetype todo setlocal omnifunc=todo#Complete
        " Auto complete projects
        au filetype todo imap <buffer> + +<C-X><C-O>
        " Auto complete contexts
        au filetype todo imap <buffer> @ @<C-X><C-O>

call plug#end()

colorscheme nord

set sessionoptions-=help

" folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" syntax and plugins
filetype plugin on
syntax on

set encoding=utf-8
set nonumber relativenumber
set numberwidth=3
:nmap <C-N><C-N> :set nu!<CR>:set relativenumber!<CR>

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
"Tab to open buffer menu
set wildchar=<Tab> wildmenu wildmode=full

" Windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

set noswapfile
set cursorline
set colorcolumn=88

autocmd BufWritePre *.py execute ':Black'

set ignorecase
set smartcase

set hidden

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

"" Close loclist when buffer is closed
augroup autoclose
    autocmd!
    autocmd QuitPre * if &filetype !=# 'qf' | lclose | endif
augroup END

" Tmux window title
if exists('$TMUX')
    autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave * call system("tmux setw automatic-rename")
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
endif
set title

"" Nondefault paste
vnoremap p "_dP
