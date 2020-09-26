nnoremap <silent> <C-space> :call <SID>rails_edit()<CR>

function! s:rails_edit_impl_2(type, name)
  execute 'E' . a:type . ' ' . a:name
endfunction

function! s:rails_edit_impl_1(type, timer)
  let files = systemlist('bash -c "find app/' . a:type . 's -maxdepth 1 -name ''*.rb'' -exec basename {} \\; | sed \"s/\(_controller\|_helper\)\{0,1\}\.rb$//g\""')
  call fzf#run(fzf#wrap({ 'source': files, 'sink': function('s:rails_edit_impl_2', [a:type]) }))
endfunction

function! s:delayed_rails_edit_impl_1(type)
  call timer_start(1, function('s:rails_edit_impl_1', [a:type]))
endfunction

function! s:rails_edit()
  return fzf#run(fzf#wrap({ 'source': ['model', 'controller', 'helper'], 'sink': function('s:delayed_rails_edit_impl_1') }))
endfunction
