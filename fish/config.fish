set fish_greeting ''

set -gx N_PREFIX ~/.n
set -gx PATH ~/.bin ./node_modules/.bin /usr/local/opt/coreutils/libexec/gnubin $N_PREFIX/bin $PATH
set -gx CDPATH ~ ~/Code ~/Code/caseworker .

source ~/.config/fish/aliases.fish
