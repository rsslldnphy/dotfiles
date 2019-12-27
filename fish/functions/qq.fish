function qq
  set casekit_repo "$HOME/Code/ck/$argv[1]"
  set radar_repo "$HOME/Code/onourradar/$argv[1]"
  set repo "$HOME/Code/$argv[1]"
  if test -d $casekit_repo
    cd $casekit_repo
  else if test -d $radar_repo
    cd $radar_repo
  else if test -d $repo
    cd $repo
  else
    echo "Repo not found: $argv[1]"
  end
end
