"VM RC CONFIG

"change to normal mode
inoremap kj <ESC>
vnoremap kj <ESC>


"Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


nnoremap <leader><leader>L :ls<CR>:b<space>

"Colors
syntax enable
set background=dark   " or light, depending on your preference

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set nohlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
"set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
"set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.

" Cursor Shape Based on Mode
if exists('+cursorline')
  " For Vim 7.3 and later (and NeoVim)
  let &t_SI = "\<Esc>[5 q"  " iCursor Style: Block
  let &t_SR = "\<Esc>[3 q"  " rCursor Style: Underline
  let &t_EI = "\<Esc>[2 q"  " nCursor Style: Vertical Bar
  let &t_EI .= "\<Esc>[ q" "Normal Cursor Style: Block (fallback)"
else
  " For older Vim versions
  autocmd InsertEnter * :set cursorline
  autocmd InsertLeave * :set nocursorline
endif

"Exp in same pane
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Optional:  Leader Key (if not already set)
if !hasmapto('<Plug>NERDTreeToggle')
  let mapleader = " " "Use comma as leader key, since backspace is usually used
endif

" Vertical and Horizontal Split Bindings
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Resize Window Bindings
nnoremap <leader>j :resize -2<CR>
nnoremap <leader>k :resize +2<CR>
nnoremap <leader>h :vertical resize -2<CR>
nnoremap <leader>l :vertical resize +2<CR>


" Save (Write) Current Buffer
nnoremap <leader>w :write<CR>

" Close Current Buffer (Without Saving if Modified)
nnoremap <leader>q :bdelete<CR>

" Save and Close (Write and Quit) Current Buffer
nnoremap <leader>x :x<CR>

" Save and Close (Write and Quit) Current Buffer
nnoremap <leader>X :x!<CR>


" Quit Vim Entirely (Close All Buffers)
nnoremap <leader>Q :qa!<CR>

" Open file
nnoremap <leader>f :Exp<CR>

set nobackup
set nowritebackup
set noswapfile

