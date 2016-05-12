function qq {
  local repo="$HOME/Code/$1"
  [ -d $repo  ] && cd $repo || echo "Repo or course not found: $1" && return 1;
}

_qq() {
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    projects=$(cd ~/Code ; ls -d */. | sed 's/\/\.//g')
    COMPREPLY=($(compgen -W "${projects}" -- ${cur}))
}

complete -o bashdefault -o default -o nospace -F _qq qq
