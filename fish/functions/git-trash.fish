function git-trash
  echo "Non-main branches:"
  git branch | grep -v main | cat
  echo
  read -P "Delete them all [y/n]? " yn
  switch $yn
    case "y"
      git branch | grep -v main | xargs git branch -D
    case '*'
  end
end
