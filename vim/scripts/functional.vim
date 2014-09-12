function! DoAll(fns, x)
  if a:fns == [] | return a:x
  else           | return DoAll(a:fns[1:], a:fns[0](a:x))
endfunction
