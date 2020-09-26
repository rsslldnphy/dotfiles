source ~/.config/fish/aliases.fish

# SSH
ssh-add -l |grep -q (ssh-keygen -lf ~/.ssh/id_rsa  | awk '{print $2}') || ssh-add ~/.ssh/id_rsa

# Node
set -gx N_PREFIX ~/.n
set -gx PATH ~/.local/bin ./node_modules/.bin $N_PREFIX/bin $PATH

# Python
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
status --is-interactive; and source (rbenv init -|psub)

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/

# GNU utils
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

# Misc
set -gx fish_greeting ''
set -gx EDITOR /usr/local/bin/nvim
set -gx CDPATH . ~/Code/ck ~/Code/ck/casekit ~/Code/onourradar ~/Code ~

set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# deal with fish/catalina autocomplete issue: https://github.com/fish-shell/fish-shell/issues/6270
function __fish_describe_command; end
source /usr/local/opt/asdf/asdf.fish
set -g fish_user_paths "/usr/local/opt/postgresql@11/bin" $fish_user_paths
