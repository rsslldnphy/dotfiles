function qq {
  local repo="$HOME/Code/$1"
  [ -d $repo  ] && cd $repo || echo "Repo or course not found: $1" && return 1;
}

_qq() {
    local token="${COMP_WORDS[COMP_CWORD]}";
    COMPREPLY=($(ls -1 ~/Code | gawk -v IGNORECASE=1 -v p="${token}" 'p==substr($0,0,length(p))'));
}

complete -o bashdefault -o default -o nospace -F _qq qq
