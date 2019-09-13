function gi
  set CURRENT_ISSUE (git rev-parse --abbrev-ref HEAD -- | sed 's/issue-//')
  git issue show $CURRENT_ISSUE
end
