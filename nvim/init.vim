set nocompatible
filetype plugin indent on
syntax on

if &shell =~# 'fish$'
  set shell=bash
endif

call plug#begin('~/.config/nvim/vim-plug')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'ervandew/supertab'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
" 
Plug 'hashivim/vim-terraform',                     { 'for': 'terraform' }
Plug 'fatih/vim-nginx',                            { 'for': 'nginx'     }
" 
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure'   }
Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure'   }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure'   }
Plug 'guns/vim-sexp',                              { 'for': 'clojure'   }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure'   }

Plug 'vim-scripts/Align',                          { 'for': 'sql'       }

call plug#end()

colorscheme one

set autoindent
set autoread
set background=dark
set backspace=2
set clipboard=unnamed
set cmdheight=2
set colorcolumn=80
set complete-=i
set cursorline
set dictionary+=/usr/share/dict/words
set display=lastline
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<
set mouse=a
set mousemodel=popup
set noswapfile
set nowrap
set number
set pastetoggle=<F2>
set scrolloff=999
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set sidescrolloff=5
set smartcase
set smarttab        " sw at the start of the line, sts everywhere else
set splitbelow
set splitright
set tabstop=2
set termguicolors
set virtualedit=block
set visualbell
set wildmenu
set wildmode=longest:full,full

"" Jeremy - I mean comma! - for leader
let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","
nnoremap \ ,

"" disable ex mode until I learn if it's actually still useful
nnoremap Q <nop>

"" Splits
nmap <leader>v :vs<CR>
nmap <leader>h :sp<CR>

"" Clear search highlight
nmap <leader><CR> :nohl<CR>

"" Movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

let g:airline_theme='one'

let g:ctrlp_map = '<leader><space>'
let g:ctrlp_user_command = 'ag %s -l --nogroup --column -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_reuse_window = 'nerdtree'
let g:ctrlp_working_path_mode = 0
nmap <leader>b :CtrlPBuffer<cr>

"" Ack/Ag
let g:ackprg = 'ag --nogroup --column'
map <C-f> :Ack<space>""<C-b>
map <leader>f :Ack<space>""<C-b>

"" Airline
let g:airline_powerline_fonts = 1

"" add %% expansion for current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"" Projectionist
"" see dotfiles/projections for example .projections.json files to add to
"" your project root
nmap <leader><leader> :A<CR>

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

cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>

"" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
