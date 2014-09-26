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

" Ack in project
map <C-f> :Ack<space>""<C-b>
map <C-x><C-f> :Ack<space>""<C-b>

" Splits
map <leader>v :vs<cr>

" Convert to Ruby 1.9 hash syntax
map <leader>pp :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>

" Regenerate tags file (Ruby Specific)
map <F9> :!ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --extra=+f -R *<CR><CR>

" Tabs
nmap <leader>] :tabn<cr>
nmap <leader>[ :tabp<cr>
nmap T :tabnew<cr>

" context sensitive tab key
inoremap <tab> <c-r>=Util::InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Unhighlight search terms
nnoremap <Leader><CR> :nohlsearch<cr>

" Deal with common tpyos
command! W   :w
command! Wa  :wa
command! Wq  :wq
command! Wqa :wqa
command! E   :e

nmap <leader><space> :CtrlP<CR>
noremap <C-x><C-c> :!tmux confirm kill-session<CR>

function! OverloadedIndent()
  execute "normal! gg0=G"
  execute "normal! :%s/\s\+$//e<CR>"
  call Fussbudget::align()
endfunction
nmap <leader>gg=G call OverloadedIndent()<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

nnoremap <leader>b :buffers<CR>:buffer<space>
nnoremap <leader>k :bdelete<space>

nnoremap <silent> <leader><C-h> :call PareditMoveLeft()<CR>
nnoremap <silent> <leader><C-l> :call PareditMoveRight()<CR>
nnoremap <silent> <leader><C-s> :call PareditSplice()<CR>

inoremap <buffer> <silent> <C-h> <C-r>=<C-u>PareditMoveLeft()<CR><bs><right>
inoremap <buffer> <silent> <C-l> <C-r>=<C-u>PareditMoveRight()<CR><bs><right>
inoremap <buffer> <silent> <C-s> <C-r>=<C-u>PareditSplice()<CR><bs>
