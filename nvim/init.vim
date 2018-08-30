set nocompatible
filetype plugin indent on
set t_Co=256

call plug#begin('~/.config/nvim/vim-plug')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'ervandew/supertab'
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
syntax enable
set background=dark
set termguicolors
let g:airline_theme='one'

