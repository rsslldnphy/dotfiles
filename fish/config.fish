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
set -gx PATH /usr/local/opt/python/libexec/bin ~/Library/Python/3.7/bin $PATH
set -gx PATH ~/Library/Python/2.7/bin $PATH

# Rub
status --is-interactive; and source (rbenv init -|psub)

# Misc
set -gx CDPATH . ~/Code ~ ~/Code/caseworker ~/Code/solaris
set -gx EDITOR /usr/local/bin/nvim
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set -gx PATH ~/Code/apache-pulsar-2.3.0/bin $PATH

source ~/.config/fish/aliases.fish
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
