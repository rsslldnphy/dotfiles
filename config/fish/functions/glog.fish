function glog
  git log --pretty=format:'%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
end
