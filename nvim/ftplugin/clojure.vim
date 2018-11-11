let g:clojure_align_multiline_strings = 1

function! RunTests()

  if     search("clojure.test")       | let b:test_command = "(clojure.test/run-tests)"
  elseif search("cljs.test")          | let b:test_command = "(cljs.test/run-tests)"
  else                                | let b:test_command = "\"This doesn't look like a test file...\""
  endif

  exec ":Eval " . b:test_command 
endfunction

"" Fireplace
map <buffer> <C-c><C-k> :Require<CR>
map <buffer> <leader>t :call RunTests()<CR>

command! CljsConnect :Piggieback (figwheel-sidecar.repl-api/repl-env)
