" === General Settings ===
set nocompatible
syntax on
filetype plugin indent on
set timeoutlen=1000     " 1 second mapping delay
set ttimeoutlen=5       " 5 ms code delay
set autoread            " Automatically read files changed outside vim
set pastetoggle=<F2>    " Toggle paste/nopaste with F2

" === Visual Settings ===
set termguicolors
set number              " Show line numbers
set cursorline         " Highlight current line
set ruler
set rulerformat=%30(%=%t%13(\ %l,%c%V\ %P%)%)
set showcmd            " Show command being typed
set wildmenu           " Visual autocomplete ribbon for command menu
set laststatus=0       " Always show status line

" --- Color and Highlighting ---
highlight CursorLine cterm=NONE ctermbg=NONE guibg=NONE
highlight CursorLineNr cterm=bold ctermfg=Yellow guifg=Yellow
highlight Search cterm=NONE ctermfg=black ctermbg=yellow
highlight IncSearch cterm=NONE ctermfg=white ctermbg=blue
highlight clear CursorLine
highlight CursorLineNr cterm=bold ctermfg=red

" === Indentation and Formatting ===
set tabstop=4          " Number of visual spaces per tab
set softtabstop=4      " Number of spaces per tab when editing
set shiftwidth=4
set expandtab          " Use spaces instead of tabs
set autoindent
set smartindent
set smarttab           " Better tab behavior at start of line
set nrformats-=octal   " Don't consider numbers starting with 0 as octal
set formatoptions+=j   " Delete comment character when joining lines

" --- File-specific Settings ---
au BufRead,BufNewFile *.md setlocal textwidth=80
au FileType gitcommit setlocal tw=72

" === Navigation and Scrolling ===
set scrolloff=1        " Keep 1 line visible above/below cursor
set sidescroll=1       " Smooth horizontal scrolling
set sidescrolloff=2    " Keep 2 columns visible left/right of cursor
set wrap
set backspace=indent,eol,start  " Backspace over newlines

" === Search Settings ===
set incsearch          " Show search matches as characters are entered
set hlsearch           " Highlight matches
set complete-=i        " Don't scan included files for completion
set tabpagemax=50      " Allow more tabs to be opened

" === Folding Settings ===
set foldenable         " Enable folding
set foldlevelstart=10  " Most folds open by default
set foldnestmax=10
set foldmethod=indent  " Fold based on indent level

" === Special Characters ===
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" === Key Mappings ===
" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <C-L> :nohlsearch<CR><CR><C-L>

" Make Ctrl-U and Ctrl-W undoable in insert mode
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" === Tags ===
setglobal tags-=./tags tags-=./tags; tags^=./tags;

" === Functions ===
" Remove trailing whitespace only on edited lines
function! TrimWhitespaceOnChangedLines()
    let l:save = winsaveview()
    let l:curr_line = line('.')
    let l:first_line = line("'[")
    let l:last_line = line("']")
    execute printf('%d,%ds/\s\+$//e', l:first_line, l:last_line)
    call winrestview(l:save)
endfunction

" === Auto Commands ===
" Trim whitespace on save
autocmd BufWritePre * call TrimWhitespaceOnChangedLines()

" Auto-detect and switch color scheme based on system theme
function! s:IsDarkMode()
    let l:mode = trim(system('defaults read -g AppleInterfaceStyle 2>/dev/null'))
    return l:mode ==# 'Dark'
endfunction

function! s:SetTheme()
    if s:IsDarkMode()
        colorscheme monokai_pro_filter_octagon
    else
        colorscheme monokai_pro_light
    endif
endfunction

" Set initial colorscheme
call s:SetTheme()

" Theme switching
augroup ThemeSwitcher
    autocmd!
    autocmd FocusGained * call s:SetTheme()
    "autocmd CursorHold * call s:SetTheme()
augroup END

" === Plugin Management ===
call plug#begin()
" List your plugins here
Plug 'airblade/vim-gitgutter'
call plug#end()

" === System Settings ===
set updatetime=100  " theme checking

" === GitGutter settings ===
autocmd BufWritePost * GitGutter " Update on file save
highlight SignColumn guibg=NONE ctermbg=NONE " apply after color theme above

