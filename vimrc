set nocompatible

call plug#begin('~/.vim-plug')

Plug 'fatih/vim-nginx',         { 'for': 'nginx'   }

Plug 'guns/vim-sexp'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'

Plug 'jordwalke/flatlandia'
Plug 'junegunn/vim-easy-align'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace',     { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

call plug#end()
      
"""" GENERAL SETTINGS
"""" 
"""" I was going to comment these, but then I realised a better option was
"""" to remind you that you can see detailed help for each option by running
""""
"""" :help 'option'
""""

"" window appearance & behaviour
set cmdheight=2
set cursorline
set colorcolumn=80
set display=lastline
set laststatus=2
set lazyredraw
set number
set scrolloff=999
set sidescrolloff=999
set showcmd
set splitright
set splitbelow
set t_Co=256
set visualbell

"" indentation and whitespace
set autoindent
set backspace=2
set encoding=utf-8
set expandtab
set nowrap
set shiftround
set shiftwidth=2
set showmatch
set smarttab        " sw at the start of the line, sts everywhere else
set tabstop=2
set virtualedit=block

"" files & buffers
set autoread
set hidden
set noswapfile

"" search
set hlsearch
set ignorecase
set incsearch
set smartcase

"" completion
set complete-=i
set dictionary+=/usr/share/dict/words
set wildmenu
set wildmode=longest:full,full

"" mouse, modifier keys, and clipboard
set mouse=a
set mousemodel=popup
set pastetoggle=<F2>

"" miscellaneous
set clipboard=unnamed
set history=200
if exists('macmeta')
  set macmeta
endif
set secure

filetype plugin indent on
syntax enable
colorscheme torte
highlight LineNr ctermfg=grey


"""" MAPPINGS

"" leader
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

"" Emacs (sorry) movement in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

execute "set <M-b>=\eb"
execute "set <M-f>=\ef"
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>

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

"" Tab-complete
imap <tab>   <C-n>
imap <S-tab> <C-p>

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
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
let g:rbpt_max = 15

"" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
map <C-f> :Ack<space>""<C-h>
map <leader>f :Ack<space>""<C-h>

"" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nogroup --nocolor --column -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_working_path_mode = 0
nmap <leader><space> :CtrlP<CR>

"" Projectionist - see ftplugin files for g:projectionist_heuristics
nmap ,, :A<CR>
let g:projectionist_autocreate_alternative_file = 1

"" Fireplace
map <C-c><C-k> :Require<CR>

"" Fussbudget
function! CleanupWhitespace()
  try
    exec ':%s/\s\+$//g'
  catch "E486: Pattern not found: \s\+$"
  endtry
endfunction

autocmd BufReadPost *.edn set filetype=clojure

map <leader>c :call CleanupWhitespace<CR>
autocmd Filetype clojure map <leader>c :call CleanupWhitespace()<CR>
