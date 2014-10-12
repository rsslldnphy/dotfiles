setlocal lispwords+=defroutes,fact,facts,defproject,describe,it

let g:paredit_electric_return = 0

noremap ,, :A<CR>
map <leader>r :Eval (user/reset)<cr>
map <C-x><C-e> :Eval<cr>
map <C-c><C-k> :%Eval<cr>

let g:projectionist_heuristics = {
      \  '*.clj': {
      \    'src/*.clj': {'alternate': 'test/{}_test.clj'},
      \    'test/*_test.clj': {'alternate': 'src/{}.clj'},
      \    'src-clj/*.clj': {'alternate': 'test-clj/{}_test.clj'},
      \    'test-clj/*_test.clj': {'alternate': 'src-clj/{}.clj'},
      \  },
      \}
