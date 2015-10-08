let g:paredit_electric_return = 0

noremap ,, :A<CR>
map <leader>r :Eval (user/reset)<cr>
map <leader>R :Eval (user/refresh)<cr>
map <C-x><C-e> :Eval<cr>
map <C-c><C-k> :%Eval<cr>

let g:projectionist_heuristics = {
      \  '*.clj': {
      \    'src/*.clj': {'alternate': 'test/{}_test.clj'},
      \    'test/*_test.clj': {'alternate': 'src/{}.clj'},
      \    'src-clj/*.clj': {'alternate': 'test-clj/{}_test.clj'},
      \    'test-clj/*_test.clj': {'alternate': 'src-clj/{}.clj'},
      \    'src/cljs/*.cljs': {'alternate': 'test/cljs/{}_test.cljs'},
      \    'test/cljs/*_test.cljs': {'alternate': 'src/cljs/{}.cljs'},
      \    'src-cljs/*.cljs': {'alternate': 'test-cljs/{}_test.cljs'},
      \    'test-cljs/*_test.cljs': {'alternate': 'src-cljs/{}.cljs'},
      \  },
      \}

function! s:ProjectName()
  return fnamemodify(getcwd(), ":t")
endfunction

function! s:ProjectDir()
  return getcwd()
endfunction

function! s:Repl()
  execute "!tmux new-window -d -n \"" . s:ProjectName() . "-REPL\" \"cd " . s:ProjectDir() . " && lein repl\""
endfunction

function! s:Midje()
  execute "!tmux new-window -d -n \"" . s:ProjectName() . "-TESTS\" \"cd " . s:ProjectDir() . " && make watch-midje\""
endfunction

function! s:Expectations()
  execute "!tmux new-window -d -n \"" . s:ProjectName() . "-TESTS\" \"cd " . s:ProjectDir() . " && make watch-expect\""
endfunction

function! s:Cljs()
  execute "!tmux new-window -d -n \"" . s:ProjectName() . "-CLJS\" \"cd " . s:ProjectDir() . " && make watch-cljs\""
endfunction

function! s:Sass()
  execute "!tmux new-window -d -n \"" . s:ProjectName() . "-SASS\" \"cd " . s:ProjectDir() . " && make watch-sass\""
endfunction

command! Repl silent call s:Repl() | execute ":redraw!"
command! Midje silent call s:Midje() | execute ":redraw!"
command! Expectations silent call s:Expectations() | execute ":redraw!"
command! Cljs silent call s:Cljs() | execute ":redraw!"
command! Sass silent call s:Sass() | execute ":redraw!"

command! Expectations execute ":w" | execute ":%Eval" | execute ":Eval (run-tests [*ns*])"
map <leader>t :Expectations<CR>
