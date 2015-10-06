"" Projectionist
nmap ,, :A<CR>
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

function! RunTests()
  :w
  :%Eval
  if search("expectations")
    :Eval (run-tests [*ns*])
  endif
endfunction

map <leader>t :execute RunTests()<CR>
