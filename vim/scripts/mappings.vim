" Comma for leader
let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","

" Quick access to test files
map <leader>, :call Testing::AlternateFile()<cr>
map <leader>t :call Testing::RunTests()<cr>
map <leader>T :call Testing::RunNearestTest()<cr>
map <leader>c :!bundle exec cucumber<cr>

" Remove temptation of arrow keys
" noremap <Up>       :echoerr "Use k instead!"<CR>
" noremap <Down>     :echoerr "Use j instead!"<CR>
" noremap <Left>     :echoerr "Use h instead!"<CR>
" noremap <Right>    :echoerr "Use l instead!"<CR>

" inoremap <Up>     <nop>
" inoremap <Down>   <nop>
" inoremap <Left>   <nop>
" inoremap <Right>  <nop>

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

map <leader>f :call SelectaCommand("find * -type f -o -path tmp -prune", "", ":e")<cr>

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction
