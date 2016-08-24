function qq
  set repo "$HOME/Code/$argv[1]"
  if test -d $repo
    cd $repo
  else
    echo "Repo not found: $argv[1]"
  end
end
