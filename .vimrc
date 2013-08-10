" my (chris.kirke@gmail.com) .vimrc
"
" i'm a recent vim convert (2013) and some of my choices
" are likely explained by my past shell/editor history:
"
"  shell: Bourne => Korn => bash, always with emacs bindings
"
" editor: CBM 4000-series
"         WordStar (MS-DOS)
"         DEC EDT (RSX11M+)
"         EDT (SCO Xenix/Unix)
"         joe (SCO Unix w/EDT keymapping)
"         joe (SCO Unix/Linux/MacOSX w/standard keymapping)
"         vim (Linux, MacOSX)

" everything starts with vim settings
set nocompatible

" remap leader
let mapleader=","

" use vundle for addon management
set runtimepath +=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'

" set airline behavior
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=1

" set gundo behavior
let g:gundo_close_on_revert=1

" set mouse behavior
set mouse=a

" set backspace behavior
set backspace=indent,eol,start

" set command behavior
set incsearch
set showcmd

" set syntax-specific behavior
filetype plugin indent on
syntax on
set hlsearch

" set backup/redo/undo behavior
set backup
set history=50
set undodir=~/.vim/undo
set undofile

" set lastline/ruler/statusline/tabline behavior
set display+=lastline
set laststatus=2
set noshowmode
set number
set ruler
set showtabline=1

" set window title behavior
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)

" set indent/tab behavior
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" set code folding behavior
set foldclose=all
set foldlevelstart=0
set foldmethod=syntax
set foldnestmax=10

" set scrolling behavior
set scrollopt=ver,hor,jump

" remap keys
inoremap jk <Esc>
inoremap <C-U> <C-G>u<C-U>
map Q gq
nnoremap ;; :GundoToggle<CR>
