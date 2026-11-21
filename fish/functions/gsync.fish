function gsync
    git fetch origin; or return

    # origin/HEAD points at the default branch (set on clone); fall back to checking main/master
    set -l base (git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null)
    if test -z "$base"
        git rev-parse -q --verify origin/main >/dev/null; and set base origin/main; or set base origin/master
    end

    git rebase $base
end
