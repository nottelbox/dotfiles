set nocompatible            " disable compatibility to old-time vi
set number                  " show line numbers
set relativenumber          " count from selected line
set autoindent              " indent a new line the same amount as the line just typed
set tabstop=4               " number of columns occupied by a tab
set shiftwidth=4            " width for autoindents
set expandtab               " use apropriate number of spaces to insert a <Tab>
set smarttab
set scrolloff=8             " show lines of context arround cursor
set sidescrolloff=8
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set expandtab               " converts tabs to white space
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set termguicolors
set list
set listchars=tab:▸\ ,trail:·
set ttyfast                 " Speed up scrolling in Vim

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'lifepillar/vim-mucomplete'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

call plug#end()

let mapleader="\<space>"
let g:airline_powerline_fonts = 1

" source config file
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
" nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indentin
vnoremap < <gu
vnoremap > >gv

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" insert new line without entering insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j

" easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" toggle NERDTree with leader-n and place cursor on current file
nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>N :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
