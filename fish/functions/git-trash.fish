function git-trash
  echo "Non-master branches:"
  echo (git branch | grep -v master)
  echo
  read -P "Delete them all [y/n]? " yn
  switch $yn
    case "y"
      git branch | grep -v master | xargs git branch -D
    case '*'
  end
end

