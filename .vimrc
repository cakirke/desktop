" my (chris.kirke@gmail.com) .vimrc
"
" started with a copy of distributed vimrc_example.vim
"
" i'm a recent vim convert (2013) and some of my choices
" are likely explained by my past shell/editor history:
"
" shell: Bourne => Korn => bash, always with emacs bindings
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
filetype off
set runtimepath +=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'c9s/perlomni.vim'
Plugin 'edsono/vim-matchit'
Plugin 'gmarik/vundle'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'marijnh/tern_for_vim'
Plugin 'mileszs/ack.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-perl/vim-perl'

" configure airline behavior
let g:airline_theme = 'dark'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_iminsert = 1
let g:airline_section_z = '%3c [0x%03B] %3p%% %2(%{winnr()}%)'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1

" configure easymotion behavior
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1

" configure gitgutter behavior
let g:gitgutter_sign_column_always = 1

" configure gundo behavior
let g:gundo_close_on_revert=1

" configure syntastic behavior
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 3

" configure syntax-specific behavior
filetype plugin indent on
syntax on

" configure color scheme
highlight link EasyMotionTarget VisualNOS 
highlight link EasyMotionShade LineNr
highlight LineNr ctermfg=DarkGrey
highlight SignColumn ctermbg=None
set background=dark

" configure mouse behavior
set mouse=a

" configure backspace behavior
set backspace=eol,indent,start

" configure command behavior
set incsearch
set showcmd
set timeoutlen=1000
set ttimeout
set ttimeoutlen=100
set wildmenu
set wildmode=longest:list,full

" configure autocompletion
set complete=.,w,b,u,t,i
set completeopt=longest,menu,preview

" configure backup behavior
let backup_dir = expand('~/.vim/backup')
if filewritable(backup_dir) != 2
    call mkdir(backup_dir, 'p')
endif
let &backupdir=backup_dir
set backup

" configure swap behavior
let swap_dir = expand('~/.vim/swap')
if filewritable(swap_dir) != 2
    call mkdir(swap_dir, 'p')
endif
let &directory=swap_dir
set swapfile

" configure undo behavior
if has('persistent_undo')
    let undo_dir = expand('~/.vim/undo')
    if filewritable(undo_dir) != 2
        call mkdir(undo_dir, 'p')
    endif
    let &undodir=undo_dir
    set undofile
endif

" configure buffer/window/tab behavior
set confirm
set hidden
set switchbuf=useopen,usetab
set tabpagemax=8
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)

" configure lastline/linenumber/statusline/tabline behavior
set cursorline
set display+=lastline
set laststatus=2
set noshowmode
set number
set showtabline=2

" configure history/search behavior
set history=100
set hlsearch
set ignorecase
set incsearch
set smartcase

" configure viminfo storage behavior
set viminfo=!,h,'500,<1000,s1000,/1000,:1000

" configure indent/tab behavior
set autoindent
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=8

" configure code folding behavior
set foldclose=all
set foldlevelstart=10
set foldmethod=syntax
set foldnestmax=10

" configure scrolling behavior
set scrolloff=4
set scrollopt=ver,hor,jump

" enable paste toggle
set pastetoggle=<ESC>p

" avoid duplicate terminal output for subshell commands
set shellpipe=>

" map keys - NORMAL mode
nnoremap ' `
nnoremap ` '
nnoremap <silent> <Space> :nohlsearch<CR><Space>
nmap <leader><leader> <Plug>(easymotion-sn)
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gu :GundoToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>sc :SyntasticCheck<CR>
nnoremap <leader>vc :PluginClean<CR>
nnoremap <leader>vu :PluginUpdate<CR>

for i in range(1,9)
    execute "nmap <silent> <leader>b" . i . " <Plug>AirlineSelectTab" . i
    execute "nnoremap <silent> <leader>t" . i . " " . i . "gt"
    execute "nnoremap <silent> <leader>w" . i . " :" . i . "wincmd w<CR>"
endfor

" map keys - INSERT mode
inoremap <ESC>v <ESC>p<C-R>*<ESC>p

" map keys - VISUAL mode
vnoremap <Space> "*y

" command to run perltidy on a range of lines
command -range=% -nargs=* PerlTidy <line1>,<line2>!perltidy

" function to run perltidy on a whole buffer and restore cursor position
function! RunPerlTidy()
    let position = line2byte(line("."))
    :PerlTidy
    execute "goto " . position
endfunction

" function to display help in its own tab for easier reading
function! HelpInTab()
    if &buftype == 'help'
        execute "normal! \<C-W>T"
    endif
endfunction

" function to restore previous cursor position on buffer open
function! RestoreCursorPosition()
    if line("'\"") > 0 && line("'\"") <= line("$")
        execute "normal! g'\""
    endif
endfunction

" local custom autocmds in their own group
augroup local
    " clear all commands in this group
    autocmd!
    " open help buffers in a separate tab 
    autocmd BufEnter *.txt call HelpInTab()
    " restore previous cursor position on buffer read
    autocmd BufReadPost * call RestoreCursorPosition()
    " map perltidy shortcuts
    autocmd FileType perl nnoremap <leader>pt :call RunPerlTidy()<CR>
    autocmd Filetype perl vnoremap <leader>pt :PerlTidy<CR>
    " choose read-only to avoid simultaneous edits of the same file
    autocmd SwapExists * :let v:swapchoice = 'o'
augroup END
