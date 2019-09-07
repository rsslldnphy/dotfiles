set fish_greeting ''

ssh-add -l |grep -q (ssh-keygen -lf ~/.ssh/id_rsa  | awk '{print $2}') || ssh-add ~/.ssh/id_rsa

set -gx N_PREFIX ~/.n
set -gx PATH ~/.bin ./node_modules/.bin /usr/local/opt/coreutils/libexec/gnubin $N_PREFIX/bin $PATH
set -gx CDPATH ~ ~/Code ~/Code/caseworker .
set -gx GOPATH ~/.go

source ~/.config/fish/aliases.fish
