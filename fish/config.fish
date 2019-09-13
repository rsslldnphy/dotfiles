set fish_greeting ''

# SSH
ssh-add -l |grep -q (ssh-keygen -lf ~/.ssh/id_rsa  | awk '{print $2}') || ssh-add ~/.ssh/id_rsa

# Node
set -gx N_PREFIX ~/.n
set -gx PATH ./node_modules/.bin $N_PREFIX/bin $PATH

# Core Utils
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

# Go
set -gx GOPATH ~/.go

# Python
set -gx PATH ~/Library/Python/3.7/bin $PATH

# Ruby
status --is-interactive; and source (rbenv init -|psub)

# Misc
set -gx CDPATH ~ ~/Code ~/Code/caseworker ~/Code/solaris .
set -gx EDITOR /usr/local/bin/nvim

source ~/.config/fish/aliases.fish
