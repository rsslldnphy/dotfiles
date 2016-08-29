set nocompatible

if &shell =~# 'fish$'
  set shell=bash
endif

"""" PLUGINS

call plug#begin('~/.vim-plug')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

Plug 'dag/vim-fish',                               { 'for': 'fish'    }
Plug 'fatih/vim-nginx',                            { 'for': 'nginx'   }

Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

Plug 'vim-scripts/Align',                          { 'for': 'sql'     }
Plug 'vim-scripts/SQLUtilities',                   { 'for': 'sql'     }


Plug 'chriskempson/base16-vim'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

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
set sidescrolloff=5
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
set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<
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

"" colorschemes and syntax highlighting
filetype plugin indent on
syntax enable
colorscheme base16-default-dark
highlight LineNr ctermfg=grey

"""" MAPPINGS

"" Jeremy - I mean comma! - for leader
let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","

"" disable ex mode until I learn if it's actually still useful
nnoremap Q <nop>

"" add %% expansion for current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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

" This was a real pain to get working.
" Don't really understand what the `set` commands are doing
" but it seems to work for allowing word-wise movement in command mode.
" The insert-mode mappings are just there because if they're not,
" Escape followed by a 'b' is interpreted as <M-b>.
execute "set <M-b>=\eb"
execute "set <M-f>=\ef"
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>
inoremap <M-f> <esc>f
inoremap <M-b> <esc>b

"" Splits
nmap <leader>v :vs<CR>
nmap <leader>h :sp<CR>

"" Clear search highlight
nmap <leader><CR> :nohl<CR>

"" Movement between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"" Handle common tpyos
command! W   :w
command! Wa  :wa
command! Wq  :wq
command! Wqa :wqa
command! E   :e

"" Tab-complete
imap <tab> <C-n>
imap <S-tab> <C-p>

"" Remove trailing whitespace
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"""" PLUGIN SETTINGS

"" NERD Tree
let NERDTreeMinimalUI=1

"" Rainbow Parens
let g:rainbow_active = 1

"" Ack/Ag
let g:ackprg = 'ag --nogroup --column'
map <C-f> :Ack<space>""<C-b>
map <leader>f :Ack<space>""<C-b>

"" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nogroup --column -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_reuse_window = 'nerdtree'
let g:ctrlp_working_path_mode = 0
nmap <leader><space> :CtrlP<CR>

"" Projectionist
"" see dotfiles/projections for example .projections.json files to add to
"" your project root
nmap <leader><leader> :A<CR>

"" Airline
let g:airline_powerline_fonts = 1

"" EasyAlign
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
      \ '%': { 'pattern': ' ' , 'filter': 'g/^\S' , 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0}
      \ }

"" Hide colorcolumn in quickfix mode
au BufReadPost quickfix setlocal colorcolumn=0

"" SQL Utilities
let g:sqlutil_align_comma = 1
let g:sqlutil_keyword_case = '\U'
vmap <silent>sf <Plug>SQLUFormatter<CR>

"" text object for SQL queries
vnoremap aq :normal! {<cr>/^[^\-]<CR>v/;<CR>:<C-w>nohl<CR>gv
vnoremap iq :normal! {<cr>/^[^\-]<CR>v/;<CR>:<C-w>nohl<CR>gv

