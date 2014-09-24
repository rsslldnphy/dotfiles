function! Util::CleanupWhiteSpace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! Util::InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k' | return "\<tab>"
  else                                     | return "\<c-p>"
  endif
endfunction
