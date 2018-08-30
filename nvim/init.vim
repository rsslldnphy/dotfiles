set nocompatible
filetype plugin indent on
set t_Co=256

call plug#begin('~/.config/nvim/vim-plug')
Plug 'rakr/vim-one'
Plug 'dag/vim-fish'
call plug#end()

colorscheme one
syntax enable
set background=dark
set termguicolors
let g:airline_theme='one'

