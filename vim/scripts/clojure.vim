" VimClojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1

" Paredit
let g:paredit_mode = 0

augroup Clojure
  autocmd BufRead,BufNewFile *.clj setlocal lispwords+=defroutes,fact,facts,defproject,describe,it
augroup END
