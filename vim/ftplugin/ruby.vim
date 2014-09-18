" Quick access to test files
map <leader>, :call Testing::AlternateFile()<cr>
map <leader>t :call Testing::RunTests()<cr>
map <leader>T :call Testing::RunNearestTest()<cr>
map <leader>c :!bundle exec cucumber<cr>

