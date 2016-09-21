"" Syntax
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol'
let g:clojure_align_multiline_strings = 1

function! CljsRequireSource()
  for source_file in projectionist#query_file('alternate')
    let l:source_file = substitute(source_file, projectionist#path() . "/src/cljs/", "", "")
    let l:source_file = substitute(source_file, "\.cljs$", "", "")
    exec ":Require " . l:source_file
  endfor
endfunction 

function! RunTests()

  if     search("expectations")       | let b:test_command = "(run-tests [*ns*])"
  elseif search("clojure.test.check") | let b:test_command = "(binding [clojure.test.check.clojure-test/*default-test-count* 20] (run-tests))"
  elseif search("clojure.test")       | let b:test_command = "(clojure.test/run-tests)"
  elseif search("midje.sweet")        | let b:test_command = "(println \"done\")"
  elseif search("cljs.test")          | let b:test_command = "(cljs.test/run-tests)" | call CljsRequireSource()
  else                                | let b:test_command = "\"This doesn't look like a test file...\""
  endif

  write
  :Require
  exec ":Eval " . b:test_command 
endfunction

"" Fireplace
map <buffer> <C-c><C-k> :Require<CR>
map <buffer> <leader>t :call RunTests()<CR>

command! DisableFacts :%s/(fact /#_(fact /g | nohl
command! EnableFacts  :%s/#_(fact /(fact /g | nohl

command! -nargs=1 LogLevel :execute "Eval (taoensso.timbre/set-level! :" . <f-args> . ")"
