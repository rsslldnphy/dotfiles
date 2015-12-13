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
  elseif search("clojure.test")
    :Eval (run-tests)
  endif
endfunction

map <buffer> <leader>t :execute RunTests()<CR>
