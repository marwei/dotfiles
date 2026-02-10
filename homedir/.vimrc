" Minimal vim configuration
syntax enable
set background=dark

" General
set encoding=utf-8
set history=1000
set clipboard=unnamed
set mouse=a
set backspace=2

" UI
set number
set ruler
set laststatus=2
set wildmenu
set wildmode=list:longest
set showmatch
set incsearch
set ignorecase
set smartcase
set noerrorbells
set novisualbell
set shortmess=atI

" Indentation
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround

" Files
set nobackup
set noswapfile
set nowb

" Splits
set splitbelow
set splitright

" Visual line navigation
nnoremap j gj
nnoremap k gk

" Don't use Ex mode
map Q gq

" CTRL-U break undo first
inoremap <C-U> <C-G>u<C-U>

" Clipboard
noremap <leader>y "*y
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
