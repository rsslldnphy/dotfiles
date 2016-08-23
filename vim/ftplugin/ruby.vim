"" Projectionist
let g:projectionist_heuristics = {
      \  '*.rb': {
      \    'app/*.rb': {
      \       'alternate': 'spec/{}_spec.rb',
      \       'type': 'source'
      \     },
      \    'spec/*_spec.rb': {
      \       'alternate': 'app/{}.rb',
      \       'type': 'test'
      \     }
      \  },
      \}
function! RunTests()
  :w
  :!bundle exec rspec %
endfunction

map <buffer> <leader>t :execute RunTests()<CR>
