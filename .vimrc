" my (chris.kirke@gmail.com) .vimrc
"
" started with distributed vimrc_example.vim
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
let g:mapleader=","

" use vundle for addon management
set runtimepath +=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'mkitt/tabline.vim'

" set airline behavior
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=1

" set gundo behavior
let g:gundo_close_on_revert=1

" set tabline behavior
hi TabLine     ctermfg=Black ctermbg=Grey     cterm=NONE
hi TabLineFill ctermfg=Black ctermbg=Grey     cterm=NONE
hi TabLineSel  ctermfg=White ctermbg=DarkBlue cterm=NONE

" set mouse behavior
set mouse=a

" set backspace behavior
set backspace=indent,eol,start

" set command behavior
set incsearch
set showcmd
set timeoutlen=500

" set syntax-specific behavior
filetype plugin indent on
syntax on
set hlsearch

" set backup/redo/undo behavior
set backup
set history=50
set undodir=~/.vim/undo
set undofile

" set lastline/linenumber/ruler/statusline/tabline behavior
set display+=lastline
set laststatus=2
set noshowmode
set number
set ruler
set showtabline=2
highlight LineNr ctermfg=grey

" set window title behavior
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)

" set indent/tab behavior
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8

" set code folding behavior
set foldclose=all
set foldlevelstart=0
set foldmethod=syntax
set foldnestmax=10

" set scrolling behavior
set scrollopt=ver,hor,jump

" (re)map keys - ALL modes
noremap ; :

" (re)map keys - NORMAL mode
nnoremap ;; :GundoToggle<CR>
nnoremap <Space> <PageDown>

" set autocmds
augroup default
    " clear all commands in this group
    autocmd!
    " set cursor position to previous on buffer read
    autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
    " set read-only to avoid simultaneous edits of the same file
    autocmd SwapExists * :let v:swapchoice = 'o'
augroup END
