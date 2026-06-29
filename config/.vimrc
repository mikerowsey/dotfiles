"==============================================================================
" General
"==============================================================================

set nocompatible
syntax on
filetype plugin indent on

set hidden
set autoread
set mouse=a

"==============================================================================
" Appearance
"==============================================================================

set number
set relativenumber
set cursorline
set scrolloff=8
set sidescrolloff=8
set laststatus=2
set showcmd
set ruler
set showmatch

if has('termguicolors')
    set termguicolors
endif

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

"==============================================================================
" Search
"==============================================================================

set ignorecase
set smartcase
set incsearch
set hlsearch

" Clear search highlight with Esc
nnoremap <Esc> :noh<CR><Esc>

"==============================================================================
" Indentation
"==============================================================================

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

"==============================================================================
" Splits
"==============================================================================

set splitbelow
set splitright

"==============================================================================
" Completion
"==============================================================================

set wildmenu
set wildmode=longest:full,full

"==============================================================================
" Clipboard
"==============================================================================

if has("mac") || has("macunix")
    set clipboard=unnamed
else
    try
        set clipboard=unnamedplus,unnamed
    catch
    endtry
endif

"==============================================================================
" Plugins
"==============================================================================

if empty(glob('~/.vim/autoload/plug.vim'))
    finish
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1