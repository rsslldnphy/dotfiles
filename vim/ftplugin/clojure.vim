"" Projectionist
let g:projectionist_heuristics = {
      \  '*.clj': {
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
      \                    '  (:require [{dot|hyphenate} :refer :all]',
      \                    '            [expectations    :refer :all]']
      \     },
      \  },
      \}

function! RunTests()
  :w
  :%Eval
  if search("expectations")
    :Eval (run-tests [*ns*])
  endif
endfunction

map <buffer> <leader>t :execute RunTests()<CR>
