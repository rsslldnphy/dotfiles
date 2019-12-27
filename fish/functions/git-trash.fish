function git-trash
  echo "Non-master branches:"
  git branch | grep -v master | cat
  echo
  read -P "Delete them all [y/n]? " yn
  switch $yn
    case "y"
      git branch | grep -v master | xargs git branch -D
    case '*'
  end
end

