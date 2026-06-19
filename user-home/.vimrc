set number
set relativenumber

set expandtab
set tabstop=4
set shiftwidth=4

set smartindent

set ignorecase
set smartcase

set scrolloff=5

set splitbelow
set splitright

if has('clipboard')
    set clipboard=unnamedplus
endif

nnoremap <Esc> :nohlsearch<CR>

if has('termguicolors')
    set termguicolors
endif

colorscheme habamax
