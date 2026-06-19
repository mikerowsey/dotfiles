" --- 1. DISPLAY & LINE NUMBERING ---
set number
set relativenumber
set scrolloff=5

" --- 2. INDENTATION & TABS ---
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent

" --- 3. SEARCH CONFIGURATION ---
set ignorecase
set smartcase

" Clear active search highlights instantly by hitting Escape
nnoremap <Esc> :nohlsearch<CR>

" --- 4. WINDOW MANAGEMENT SPLITS ---
set splitbelow
set splitright

" --- 5. TRUECOLOR & THEME CONFIGURATION ---
if has('termguicolors')
    set termguicolors
endif

" Safely load the clean habamax colorscheme
colorscheme habamax

" Force Vim to inherit your transparent terminal background styling
highlight Normal ctermbg=none guibg=none
highlight LineNr ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none

" --- 6. DUAL-OS CLIPBOARD INTEGRATION ---
if has("mac") || has("macunix")
    set clipboard=unnamed
else
    " Linux best practice: Try unnamedplus first, fallback cleanly to unnamed
    " This ensures clipboard compatibility whether using xclip, xsel, or wayland
    try
        set clipboard=unnamedplus,unnamed
    catch
        " Safe fallback for headless Linux systems over bare SSH
    endtry
endif
