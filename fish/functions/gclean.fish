function gclean
    git fetch --prune
    git branch --format='%(refname:short) %(upstream:track)' | string replace -rf '^(\S+) \[gone\]$' '$1' | xargs -r git branch -D
end
