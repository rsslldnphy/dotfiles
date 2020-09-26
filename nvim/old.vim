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
Plug 'qpkorr/vim-renamer'

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'fatih/vim-nginx',        { 'for': 'nginx'     }

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

Plug 'guns/vim-clojure-static',                    { 'for': 'clojure'    }
Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure'    }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure'    }
Plug 'guns/vim-sexp',                              { 'for': 'clojure'    }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure'    }

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
set nobackup
set nowritebackup
set number
set pastetoggle=<F2>
set scrolloff=999
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set sidescrolloff=5
set signcolumn=yes
set shortmess+=c
set smartcase
set smarttab        " sw at the start of the line, sts everywhere else
set splitbelow
set splitright
set tabstop=2
set termguicolors
set updatetime=300
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

" let g:nvim_typescript#suggestions_enabled = 0
" let g:nvim_typescript#default_mappings = 1

" nmap <leader>d :TSGetDiagnostics<CR>
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

au BufNewFile,BufRead *.ts.ejs set filetype=javascript

let NERDTreeIgnore = ['\.pyc$', '__pycache__', '__snapshots__']

map <buffer> <C-c><C-k> :Require<CR>

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-eslint' ]

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" let g:typescript_indent_disable = 1

" light-grey
hi tsxTypeBraces guifg=#666666
" dark-grey
hi tsxTypes guifg=#aaaaaa
hi tsxComponentName guifg=#99aacc
hi tsxCloseComponentName guifg=#99aacc
hi jsObjectKey guifg=#999999
hi tsxAttributeBraces guifg=#bb88cc
hi typescriptConditional guifg=#bb88cc
hi typescriptBranch guifg=#bb88cc
hi typescriptOpSymbols guifg=#88ccbb
hi tsxString guifg=#88ccbb

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

augroup TypeScriptSyntax
  autocmd!
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
augroup END

function! TerminalExit()
  nnoremap <buffer> <CR> :bd!<CR>
  nnoremap <buffer> q :bd!<CR>
endfun

augroup TerminalExit
  autocmd!
  autocmd TermOpen * call TerminalExit()
augroup END

function! JestBindings()
  nnoremap <leader>t :te jest %<CR>
  nnoremap <leader>u :te jest % --updateSnapshot<CR>
endfun

augroup JestBindings
  autocmd!
  autocmd BufEnter *.test.{js,jsx,ts,tsx} call JestBindings()
augroup END

