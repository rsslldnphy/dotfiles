let g:projectionist_heuristics = {
      \  '*.c': {
      \    '*.c': {
      \       'type': 'source',
      \       'template': ['#include <stdio.h>',
      \                    '',
      \                    'int main ()',
      \                    '{',
      \                    '  return 0;',
      \                    '}',
      \                    '']
      \     },
      \  },
      \}

map <buffer> <leader>t :make clean %:r \| !./%:r<CR>
