" Comma for leader
let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","

" Remove temptation of arrow keys
noremap <Up>       :echoerr "Use k instead!"<CR>
noremap <Down>     :echoerr "Use j instead!"<CR>
noremap <Left>     :echoerr "Use h instead!"<CR>
noremap <Right>    :echoerr "Use l instead!"<CR>

inoremap <Up>     <nop>
inoremap <Down>   <nop>
inoremap <Left>   <nop>
inoremap <Right>  <nop>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" buffer management
nmap <F2> :bprev<cr>
nmap <F3> :bnext<cr>
nmap <F4>  :bdelete<cr>

" Ack in project
map <C-F> :Ack<space>

" Beginning and end of line
nnoremap <C-a> ^
nnoremap <C-e> $

" Splits
map <leader>v :vs<cr>

" Convert to Ruby 1.9 hash syntax
map <leader>pp :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>

" Cleanup whitespace
noremap <leader>w :call Util::CleanupWhiteSpace()<cr>

" Regenerate tags file (Ruby Specific)
map <F9> :!ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --extra=+f -R *<CR><CR>

" Tabs
nmap <leader>] :tabn<cr>
nmap <leader>[ :tabp<cr>
nmap T :tabnew<cr>

" context sensitive tab key
inoremap <tab> <c-r>=Util::InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

noremap <c-space> :CtrlP<cr>

" Open CtrlP in buffer mode
nnoremap <c-b> :CtrlPBuffer<cr>

" Open CtrlP in recent files mode
nnoremap <c-u> :CtrlPMRU<cr>

" Unhighlight search terms
nnoremap <Leader><CR> :nohlsearch<cr>

" Deal with common tpyos
command! W   :w
command! Wa  :wa
command! Wq  :wq
command! Wqa :wqa
command! E   :e

nmap ,<space> :CtrlP<CR>
noremap <C-x><C-c> :!tmux confirm kill-session<CR>
