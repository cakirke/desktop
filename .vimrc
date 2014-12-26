" my (chris.kirke@gmail.com) .vimrc
"
" started with a copy of distributed vimrc_example.vim
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
let mapleader=";"

" use vundle for addon management
set runtimepath +=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'ap/vim-css-color'
Bundle 'bling/vim-airline'
Bundle 'c9s/perlomni.vim'
Bundle 'edsono/vim-matchit'
Bundle 'gmarik/vundle'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'marijnh/tern_for_vim'
Bundle 'mileszs/ack.vim'
Bundle 'mkitt/tabline.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

" set airline behavior
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_iminsert = 1
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#tabline#enabled = 1

" set gundo behavior
let g:gundo_close_on_revert=1

" set color/highlight/tabline behavior
highlight LineNr      ctermfg=DarkGrey ctermbg=Black     cterm=none
highlight TabLine     ctermfg=Black    ctermbg=DarkGrey  cterm=none
highlight TabLineFill ctermfg=Black    ctermbg=DarkGrey  cterm=none
highlight TabLineSel  ctermfg=Black    ctermbg=LightGrey cterm=none
set background=dark

" set mouse behavior
set mouse=a

" set backspace behavior
set backspace=indent,eol,start

" set command behavior
set incsearch
set showcmd
set timeoutlen=500
set ttimeout
set ttimeoutlen=100
set wildmode=list:longest

" set syntax-specific behavior
filetype plugin indent on
syntax on

" configure autocompletion
set complete=.,w,b,u,t,i
set completeopt=longest,menu,preview
set omnifunc=syntaxcomplete#Complete

" set backup behavior
let backup_dir = expand('~/.vim/backup')
if filewritable(backup_dir) != 2
    call mkdir(backup_dir, 'p')
endif
let &backupdir=backup_dir
set backup

" set swap behavior
let swap_dir = expand('~/.vim/swap')
if filewritable(swap_dir) != 2
    call mkdir(swap_dir, 'p')
endif
let &directory=swap_dir
set swapfile

" set undo behavior
if has('persistent_undo')
    let undo_dir = expand('~/.vim/undo')
    if filewritable(undo_dir) != 2
        call mkdir(undo_dir, 'p')
    endif
    let &undodir=undo_dir
    set undofile
endif

" set buffer/window/tab behavior
set confirm
set hidden
set switchbuf=useopen,usetab
set tabpagemax=8

" set lastline/linenumber/ruler/statusline/tabline behavior
set cursorline
set display+=lastline
set laststatus=2
set noshowmode
set number
set ruler
set showtabline=2

" set search behavior
set history=1000
set hlsearch
set ignorecase
set incsearch
set smartcase

" set window title behavior
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)

" set indent/tab behavior
set autoindent
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=8

" set code folding behavior
set foldclose=all
set foldlevelstart=10
set foldmethod=syntax
set foldnestmax=10

" set scrolling behavior
set scrolloff=4
set scrollopt=ver,hor,jump

" (re)map keys - NORMAL mode
nnoremap ' `
nnoremap ` '
nnoremap <Leader>f :GundoToggle<CR>
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap b <PageUp>
nnoremap <Space> <PageDown>

" set viminfo storage behavior
set viminfo=!,'100,<50,s10,h

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

" source local configuration
if filereadable('~/.vim/local.vim')
    source ~/.vim/local.vim
endif
