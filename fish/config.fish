fish_add_path -g --move /opt/homebrew/opt/{coreutils,grep,gnu-sed}/libexec/gnubin
fish_add_path -g --move /opt/homebrew/bin
fish_add_path -g --move /opt/workbrew/bin
fish_add_path -g --move ~/.local/share/mise/shims
fish_add_path -g --move ~/.local/bin

if status is-interactive
    ssh-add -l > /dev/null || ssh-add
    set -gx GPG_TTY (tty)

    starship init fish | source
    zoxide init fish | source

    alias e nvim
    abbr p pnpm
    abbr y yarn

    abbr :q exit
    abbr gci git commit -m
    abbr gco git checkout
    abbr gl git pull
    abbr glog git log --pretty=format:"'%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset'" --abbrev-commit
    abbr gp git push
    abbr gpf git push --force-with-lease
    abbr gst git status
    abbr gti git
    abbr gr gh pr create --web

    if test -f ~/.config/op/plugins.sh
        source ~/.config/op/plugins.sh
    end
end
