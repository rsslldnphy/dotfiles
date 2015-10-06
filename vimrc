execute pathogen#infect()

"" GENERAL SETTINGS

set nocompatible
set autoindent
set autoread
set backspace=2
if exists('+breakindent')
  set breakindent showbreak=\ +
endif
set clipboard=unnamed
set cmdheight=2
set complete-=i                        " Searching includes can be slow
set cursorline
set colorcolumn=80
set dictionary+=/usr/share/dict/words
set display=lastline
set encoding=utf-8
set expandtab
set nowrap
set shiftwidth=2
set tabstop=2
set history=200
set hlsearch
set ignorecase
set incsearch                          " Incremental search
set laststatus=2                       " Always show status line
set lazyredraw
set linebreak
set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<

set mouse=nvi
set mousemodel=popup
set number
set pastetoggle=<F2>
set printoptions=paper:letter
set scrolloff=1
set shiftround
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set sidescrolloff=5
set smarttab        " sw at the start of the line, sts everywhere else
set splitright
set splitbelow
if $TERM == "xterm-256color"
  set t_Co=256
endif
set visualbell
set virtualedit=block
set wildmenu
set wildmode=longest:full,full

filetype plugin indent on
syntax enable
colorscheme flatlandia
highlight LineNr ctermfg=grey

"" MAPPINGS

let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","

"" Remove temptation of arrow keys
noremap <Up>      <nop>
noremap <Down>    <nop>
noremap <Left>    <nop>
noremap <Right>   <nop>

inoremap <Up>     <nop>
inoremap <Down>   <nop>
inoremap <Left>   <nop>
inoremap <Right>  <nop>

"" For testing .vimrc
nmap <leader>t    :source ~/.vimrc<CR>

"" Splits
nmap <leader>v    :vs<CR>
nmap <leader>h    :sp<CR>

"" Clear search highlight
nmap <leader><CR> :nohl<CR>

"" Movement between windows
nmap <C-h>        <C-w>h
nmap <C-j>        <C-w>j
nmap <C-k>        <C-w>k
nmap <C-l>        <C-w>l

"" Handle common typos
command! W   :w
command! Wa  :wa
command! Wq  :wq
command! Wqa :wqa
command! E   :e

"" PLUGIN SETTINGS

"" NERD Tree
let g:NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

"" Rainbow Parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
