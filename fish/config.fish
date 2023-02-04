# ssh
ssh-add -l > /dev/null || ssh-add

# gpg
set -gx GPG_TTY (tty)

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# aliases
alias e nvim

starship init fish | source

alias today 'ruby ~/Code/curzon/curzon.rb'
