# ssh
ssh-add -l > /dev/null || ssh-add

# gpg
set -gx GPG_TTY (tty)

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

fish_add_path /opt/homebrew/bin

# aliases


if status is-interactive
    starship init fish | source

    alias e nvim
    abbr p pnpm

    abbr :q exit
    abbr gb gh repo view --web
    abbr gci git commit -m
    abbr gco git checkout
    abbr gl git pull
    abbr glog git log --pretty=format:"'%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset'" --abbrev-commit
    abbr gp git push
    abbr gpf git push --force-with-lease
    abbr gpo 'git push -u origin (git rev-parse --abbrev-ref HEAD)'
    abbr gst git status
    abbr gti git
    abbr pr gh pr create --web
    abbr p pnpm
end
