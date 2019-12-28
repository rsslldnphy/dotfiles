source ~/.config/fish/aliases.fish

# SSH
ssh-add -l |grep -q (ssh-keygen -lf ~/.ssh/id_rsa  | awk '{print $2}') || ssh-add ~/.ssh/id_rsa

# Node
set -gx N_PREFIX ~/.n
set -gx PATH ./node_modules/.bin $N_PREFIX/bin $PATH

# Python
set -gx PATH /usr/local/opt/python/libexec/bin ~/Library/Python/3.7/bin $PATH
set -gx PATH ~/Library/Python/2.7/bin $PATH

# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=(brew --prefix openssl@1.1)"
status --is-interactive; and source (rbenv init -|psub)

# GNU utils
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

# Misc
set -gx fish_greeting ''
set -gx EDITOR /usr/local/bin/nvim
set -gx CDPATH . ~/Code/ck ~/Code/ck/casekit ~/Code/onourradar ~/Code ~

