"" Fireplace
map <buffer> <C-c><C-k> :Require<CR>
map <buffer> <leader>t :w<CR>%:Eval<CR>:Eval (clojure.test/run-tests)<CR>
