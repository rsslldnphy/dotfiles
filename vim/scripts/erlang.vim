augroup ErlangStuff
  au!
  autocmd BufRead,BufNewFile *.erl map ,t !rebar eunit<cr>
augroup END
