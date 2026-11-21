function b
    git branch --sort=-committerdate --format='%(refname:short)' | fzf --height 40% | read -l branch
    and git switch $branch
end
