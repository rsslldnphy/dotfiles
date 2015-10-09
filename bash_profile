source ~/.aliases
source ~/.env
source ~/.prompt
source ~/.bash/git-completion.sh
source ~/.bash/qq.sh

export PATH=$HOME/.bin:/usr/local/bin:$PATH

eval $(docker-machine env dev)
