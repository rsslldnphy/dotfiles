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
set exrc
set nowrap
set shiftwidth=2
set tabstop=2
set hidden
set history=200
set hlsearch
set ignorecase
set incsearch                          " Incremental search
set laststatus=2                       " Always show status line
set lazyredraw
set linebreak
set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<
if exists('+macmeta')
  set macmeta
endif
set mouse=nvi
set mousemodel=popup
set number
set pastetoggle=<F2>
set printoptions=paper:letter
set scrolloff=1
set secure
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

"" Movement in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <S-Left>
cnoremap <C-w> <S-Right>

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
map <C-c><C-k> :%Eval<CR>

function! DockerNREPL(port)
  if filereadable(@%) && (! exists("g:autoconnected_docker_nrepl") || &cp)
    try
      let docker_ip = system('docker-machine ip dev')[:-2]
      exec ":Connect nrepl://" . docker_ip . ":" . a:port . " " . getcwd()
      let g:autoconnected_docker_nrepl = 1
    catch "nREPL Connection Error: [Errno 61] Connection refused"
    endtry
  endif
endfunction

if filereadable('.docker-nrepl-port')
  let docker_nrepl_port=readfile('.docker-nrepl-port')[0]
  autocmd BufReadPost  *.clj call DockerNREPL(docker_nrepl_port)
  autocmd BufWritePost *.clj call DockerNREPL(docker_nrepl_port)
endif

"" Fussbudget
function! CleanupWhitespace()
  try
    exec ':%s/\s\+$//g'
  catch "E486: Pattern not found: \s\+$"
  endtry
endfunction

map <leader>c :call CleanupWhitespace<CR>
autocmd Filetype clojure map <leader>c :call CleanupWhitespace() \| call Fussbudget#align()<CR>
