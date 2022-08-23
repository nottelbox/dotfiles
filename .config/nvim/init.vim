:set number
:set relativenumber
:set autoindent " indent a new line the same amount as the line just typed
:set tabstop=4 " number of columns occupied by a tab
:set smarttab
:set scrolloff=5 " show lines of context arround cursor
:set softtabstop=4 " see multiple spaces as tabstops so <BS> does the right thing
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
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

call plug#end()

let mapleader=","
let g:airline_powerline_fonts = 1

" insert new line without entering insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j

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

" open NERDTree with leader-n
nnoremap <leader>n :NERDTreeFocus<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
