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
      \                    '  (:require',
      \                    '    [{dot|hyphenate} :refer :all]',
      \                    '    [expectations    :refer :all]))']
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
      \                    '  (:require',
      \                    '    [{dot|hyphenate} :refer :all]',
      \                    '    [expectations    :refer :all]))']
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
      \                    '  (:require',
      \                    '    [{dot|hyphenate} :refer :all]',
      \                    '    [expectations    :refer :all]))']
      \     },
      \  },
      \}

function! RunTests()
  :w
  :%Eval
  if search("expectations")
    :Eval (run-tests [*ns*])
  elseif search("clojure.test.check")
    :Eval (binding [clojure.test.check.clojure-test/*default-test-count* 20] (run-tests))
  elseif search("clojure.test")
    :Eval (run-tests)
  endif
endfunction

function! DockerNREPL()
  let docker_nrepl_port=readfile('.docker-nrepl-port')[0]
  let docker_ip = system('docker-machine ip default')[:-2]
  exec ":Connect nrepl://" . docker_ip . ":" . docker_nrepl_port . " " . getcwd()
endfunction

command! DockerNREPL :call DockerNREPL()

map <buffer> <leader>t :execute RunTests()<CR>
map <buffer> <leader>r :Eval (user/reset)<CR>
