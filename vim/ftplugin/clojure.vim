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

" if grep -q expectations project.clj; then
"   tmux new-window -n "$PROJECT_NAME-TESTS" "cd $PROJECT_DIR && make watch-expectations"
" fi
"
" if grep -q midje project.clj; then
"   tmux new-window -n "$PROJECT_NAME-TESTS" "cd $PROJECT_DIR && make watch-midje"
" fi
"
" if grep -q clojurescript project.clj; then
"   tmux new-window -n "$PROJECT_NAME-CLJSBUILD" "cd $PROJECT_DIR && make watch-cljs"
" fi
"
" if grep -q sass Gemfile; then
"   tmux new-window -n "$PROJECT_NAME-SASS" "cd $PROJECT_DIR && make watch-sass"
" fi
"
" tmux bind r select-window -t "$PROJECT_NAME-REPL"
" tmux bind t select-window -t "$PROJECT_NAME-TESTS"
" tmux bind c select-window -t "$PROJECT_NAME-CODE"
"
" tmux select-window -t "$PROJECT_NAME-CODE"
" tmux attach -t $PROJECT_NAME
