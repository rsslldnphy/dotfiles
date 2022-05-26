#!/usr/bin/env fish

abbr bu bundle update
abbr be bundle exec
abbr bi bundle install
abbr gpf git push --force-with-lease
abbr gb git browse
git log --pretty=format:'%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
abbr glog git log --pretty=format:"'%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset'" --abbrev-commit
git log --pretty=format:%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset --abbrev-commit
abbr glog git log --pretty=format:'%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
abbr gst git status
git push -u origin (git rev-parse --abbrev-ref HEAD)
abbr gpo 'git push -u origin (git rev-parse --abbrev-ref HEAD)'
abbr gpo git push -u origin (git rev-parse --abbrev-ref HEAD)
abbr gp git push
abbr gl git pull
abbr gci git commit -m
abbr -e git
abbr gti git
abbr git hub
abbr :q exit
abbr e nvim
abbr -a gco git checkout
