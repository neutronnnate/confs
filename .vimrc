"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

set history=700     " Lines of history VIM remembers

execute pathogen#infect()
filetype on " enable filetype detection
filetype plugin on " and plugins
filetype indent on " and indent configs
syntax on
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=0 " How many lines to keep above/below the cursor

set wildmenu "Turn on WiLd menu

set ruler "Always show current position
set number "Always show line numbers

"set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Turn off wrapping
set nowrap

set hlsearch
"set nohlsearch "Highlight search things
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching braces when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set vb t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

" Auto-wrapping related:
" set lbr   - where to break
" set tw=500 - wrap width

set ai "Auto indent
set si "Smart indet

" Set up tabbing to Python std.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround


"set bs=2                " allow backspacing over everything in insert mode


"Tabs
map th :tabnext<CR>
map tl :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

map <F2> :BufExplorer<CR>
map <F3> :NERDTreeToggle<CR>
map <C-N><C-N> :set invnumber <CR>
map <C-s> :w<CR>
" Easier switching of splits.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


set hidden

filetype plugin on
" Turn off search highlights
" set nohlsearch


" colorscheme mustang
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Zenburn color scheme
:let g:zenburn_high_Contrast=1
:let g:less_ugly_Visual=1
colorscheme zenburn

if has("gui_running") " && &term == "builtin_gui"
    set mousehide
    set nomousefocus
    set mousemodel=extend
    set mouse=a

    "Hide toolbar in gvim
    set guioptions=aegit

    " Set preferred fonts based on system
    if has('gui_macvim') || has('gui_mac')
        try
            set guifont=Droid\ Sans\ Mono:h11
        catch /E596/
            set guifont=Monaco:h12
        endtry
    elseif has('gui_win32')
        set guifont=Bitstream\ Vera\ Sans\ Mono:h12
    elseif has('unix')
        set guifont=Monospace\ 12
    endif

    if has('transparency')
        set transparency=3
    endif

"else
    " forcing the term type to be xterm fixes issues with os x and screen
"    set term=xterm
"    set t_Co=256
endif

set colorcolumn=80
highlight ColorColumn ctermbg=8 guibg=DarkGray
if has('gui_macvim') || has('gui_mac')
    highlight ColorColumn guibg=Gray17
endif

" Set shell for *nixes (has 'unix' includes linuxes)
if has('unix')
    set shell=/bin/bash
endif


set encoding=utf8
try
    lang en_US
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

if has('persistent_undo')
    "Persistent undo (vim 7.3 and up)
    if has('unix')
        set undodir=~/.vim/undodir
    elseif has('win32') || has('win64') || has('win16')
        set undodir=C:\Windows\Temp
    elseif has('dos32') || has('dos16')
        set undodir=C:\vimtemp\
    endif

    set undofile
endif

""
" Getting meta
map <F8> :source $MYVIMRC<CR> :echo "vimrc reloaded" <CR>
let $rcfile=$HOME.'/'.system("readlink -n ".$MYVIMRC)
let $rcdir=system("dirname ".$rcfile)
let $local_conf=$rcfile."_local"

if filereadable($local_conf)
    source $local_conf
endif

if !exists(':Erc')
    command Erc :e $MYVIMRC
endif


let NERDTreeIgnore=['\.pyc$']
let g:jedi#autocompletion_command = "<C-Space>"
