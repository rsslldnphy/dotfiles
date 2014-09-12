function! Util::CleanupWhiteSpace()
  execute "normal! ma"
  :%s/\s\+$//
  execute "normal! `a"
endfunction

function! Util::InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k' | return "\<tab>"
  else                                     | return "\<c-p>"
  endif
endfunction
