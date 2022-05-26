set nocompatible
filetype plugin indent on
syntax on

if &shell =~# 'fish$'
  set shell=bash
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'mileszs/ack.vim'
Plug 'dag/vim-fish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhartington/oceanic-next'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'scrooloose/nerdtree'

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'fatih/vim-nginx',        { 'for': 'nginx'     }

Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'guns/vim-clojure-static',                    { 'for': 'clojure'    }
Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure'    }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure'    }
Plug 'guns/vim-sexp',                              { 'for': 'clojure'    }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure'    }

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-rails'

Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

call plug#end()

let g:loaded_perl_provider = 0

" let g:coc_global_extensions = [
" 	\ 'coc-eslint',
" 	\ 'coc-git',
" 	\ 'coc-html',
" 	\ 'coc-json',
" 	\ 'coc-prettier',
" 	\ 'coc-snippets',
" 	\ 'coc-stylelint',
" 	\ 'coc-tsserver',
" 	\ 'coc-yaml',
" \ ]

set termguicolors

set encoding=utf-8
set number
set clipboard=unnamed
set colorcolumn=80

" indent by 2 spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set autoindent
set autoread
set hlsearch
set ignorecase
set incsearch
set mouse=a
set mousemodel=popup
set noswapfile
set nowrap
set nobackup
set nowritebackup
set smartcase
set splitbelow
set splitright
set visualbell

colorscheme OceanicNext

let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","
nnoremap \ ,

"" disable ex mode
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

"" add %% expansion for current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"" Remove trailing whitespace
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" "" Remove temptation of arrow keys
" noremap <Up>      <nop>
" noremap <Down>    <nop>
" noremap <Left>    <nop>
" noremap <Right>   <nop>

" inoremap <Up>     <nop>
" inoremap <Down>   <nop>
" inoremap <Left>   <nop>
" inoremap <Right>  <nop>

"" Emacs movement in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>

" source ~/.config/nvim/coc.vim
source ~/.config/nvim/typescript.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/easyalign.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/rails.vim
source ~/.config/nvim/prettier.vim
source ~/.config/nvim/ack.vim

"" Projectionist
"" see dotfiles/projections for example .projections.json files to add to
"" your project root
nmap <leader><leader> :A<CR>

let g:vimwiki_list = [
      \{'path': '~/Code/notes/goodgym', 'syntax': 'markdown', 'ext': '.md'},
      \{'path': '~/Code/notes/casekit', 'syntax': 'markdown', 'ext': '.md'}]

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

let @a = 'c2f"css={styles.roo}i'
