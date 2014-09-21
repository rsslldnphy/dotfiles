filetype plugin indent on
syntax on
syntax enable

let g:haddock_browser="/Applications/Firefox.app/Contents/MacOS/firefox"
set background=dark
"" Window
set number
set scrolloff=3
set lazyredraw
set noerrorbells
set novisualbell
set splitright
set splitbelow
set cursorline
set colorcolumn=80
set hidden

"" Text
set nowrap
set linebreak
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set list
set listchars=trail:.
set showmatch
set autoindent
set smartindent

"" Stuff
set nobackup
set nowb
set noswapfile
set foldmethod=manual
set encoding=utf-8
set history=1000
set autoread
set clipboard=unnamed
set iskeyword+=_,$,@,%,#,-

"" Mouse
set mouse=a
set mousehide
set ttymouse=xterm2
"" Search
set hlsearch
set incsearch
set ignorecase

"" Command mode
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.bundle,coverage,.DS_Store,_html,.git,*.rbc,*.class,.svn,vendor/gems/*,vendor/rails/*
set cmdheight=2
set laststatus=2
set nofoldenable

let g:ruby_path = system('echo $HOME/.rbenv/shims')

if $TERM == "xterm-256color"
  set t_Co=256
endif

nnoremap Q noop
colorscheme flatlandia

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" Show the status line
highlight LineNr ctermfg=grey

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set omnifunc=emoji#complete

