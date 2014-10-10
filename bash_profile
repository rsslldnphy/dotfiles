stty -ixon # to pass C-s and C-q through to vim etc

source ~/.aliases
source ~/.prompt
source ~/.bash/git-completion.sh
source ~/.bash/misc-functions.sh

export EDITOR=vim
export PATH=~/.rbenv/shims:/usr/local/share/npm/bin:~/.bin:/usr/local/bin:$PATH
