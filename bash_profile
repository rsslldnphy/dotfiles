stty -ixon # to pass C-s and C-q through to vim etc

source ~/.aliases
source ~/.prompt
source ~/.bash/git-completion.sh
source ~/.bash/misc-functions.sh

export EDITOR=vim
export PATH=~/.rbenv/shims:/usr/local/share/npm/bin:~/.bin:/usr/local/bin:$PATH

source ~/perl5/perlbrew/etc/bashrc
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
export CLOJURESCRIPT_HOME=/Users/rsslldnphy/Code/clojurescript
