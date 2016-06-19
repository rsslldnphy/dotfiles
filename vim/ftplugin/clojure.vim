"" Projectionist
let g:projectionist_heuristics = {
      \  '*.clj': {
      \    'src/clj/*.clj': {
      \       'alternate': 'test/clj/{}_test.clj',
      \       'type': 'source',
      \       'template': ['(ns {dot|hyphenate})',
      \                    '']
      \     },
      \    'test/clj/*_test.clj': {
      \       'alternate': 'src/clj/{}.clj',
      \       'type': 'test',
      \       'template': ['(ns {dot|hyphenate}-test',
      \                    '  (:require [{dot|hyphenate} :as {basename|hyphenate}]',
      \                    '            [clojure.test :refer [deftest testing is run-tests]]))',
      \                    '']
      \     },
      \    'src/cljc/*.cljc': {
      \       'alternate': 'test/cljc/{}_test.cljc',
      \       'type': 'source',
      \       'template': ['(ns {dot|hyphenate})',
      \                    '']
      \     },
      \    'test/cljc/*_test.cljc': {
      \       'alternate': 'src/cljc/{}.cljc',
      \       'type': 'test',
      \       'template': ['(ns {dot|hyphenate}-test',
      \                    '  (:require [{dot|hyphenate} :as {basename|hyphenate}]',
      \                    '            [clojure.test :refer [deftest testing is run-tests]]))',
      \                    '']
      \     },
      \    'src/cljs/*.cljs': {
      \       'alternate': 'test/cljs/{}_test.cljs',
      \       'type': 'source',
      \       'template': ['(ns {dot|hyphenate})',
      \                    '']
      \     },
      \    'test/cljs/*_test.cljs': {
      \       'alternate': 'src/cljs/{}.cljs',
      \       'type': 'test',
      \       'template': ['(ns {dot|hyphenate}-test',
      \                    '  (:require [{dot|hyphenate} :as {basename|hyphenate}]',
      \                    '            [cljs.test :refer-macros [deftest testing is run-tests]]))',
      \                    '']
      \     },
      \    'src/*.clj': {
      \       'alternate': 'test/{}_test.clj',
      \       'type': 'source',
      \       'template': ['(ns {dot|hyphenate})',
      \                    '']
      \     },
      \    'test/*_test.clj': {
      \       'alternate': 'src/{}.clj',
      \       'type': 'test',
      \       'template': ['(ns {dot|hyphenate}-test',
      \                    '  (:require [{dot|hyphenate} :as {basename|hyphenate}]',
      \                    '            [clojure.test :refer [deftest testing is run-tests]]))',
      \                    '']
      \     },
      \  },
      \}

function! RunTests()
  :w
  if search("expectations")
    :Require
    :Eval (run-tests [*ns*])
  elseif search("clojure.test.check")
    :Require
    :Eval (binding [clojure.test.check.clojure-test/*default-test-count* 20] (run-tests))
  elseif search("clojure.test")
    :Require
    :Eval (clojure.test/run-tests)
  elseif search("cljs.test")
    for source_file in projectionist#query_file('alternate')
      let l:source_file = substitute(source_file, projectionist#path() . "/src/cljs/", "", "")
      let l:source_file = substitute(source_file, "\.cljs$", "", "")
      exec ":Require " . l:source_file
    endfor
    :Require
    :Eval (cljs.test/run-tests)
  endif
endfunction

function! DockerNREPL()
  let docker_nrepl_port=readfile('.docker-nrepl-port')[0]
  let docker_ip = system('docker-machine ip default')[:-2]
  exec ":Connect nrepl://" . docker_ip . ":" . docker_nrepl_port . " " . getcwd()
endfunction

command! DockerNREPL :call DockerNREPL()

map <buffer> <leader>t :call RunTests()<CR>
map <buffer> <leader>r :Eval (user/reset)<CR>
