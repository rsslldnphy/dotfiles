set nocompatible
filetype plugin indent on
syntax on

if &shell =~# 'fish$'
  set shell=bash
endif

call plug#begin('~/.config/nvim/vim-plug')

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'fatih/vim-nginx',        { 'for': 'nginx'     }

Plug 'HerringtonDarkholme/yats.vim'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'
Plug 'mhartington/nvim-typescript', {'do': './install.sh' }
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/denite.nvim'

" Plug 'vim-scripts/CycleColor'

call plug#end()

colorscheme base16-eighties

set autoindent
set autoread
set background=dark
set backspace=2
set clipboard=unnamed
set cmdheight=2
set colorcolumn=80
set complete-=i
set dictionary+=/usr/share/dict/words
set diffopt+=vertical
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
set signcolumn=yes
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

let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","
nnoremap \ ,

"" easier to reach EOL
nmap E $

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

"" Airline
let g:airline_theme='one'
let g:airline_powerline_fonts = 1

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

"" Emacs movement in command mode
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

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

let g:nvim_typescript#suggestions_enabled = 0
let g:nvim_typescript#default_mappings = 1

nmap <leader>d :TSGetDiagnostics<CR>

au BufNewFile,BufRead *.ts.ejs set filetype=javascript

let NERDTreeIgnore = ['\.pyc$', '__pycache__']
