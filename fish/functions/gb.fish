function gb
    if gh pr view --json url &> /dev/null
        gh pr view --web
    else
        gh repo view --web
    end
end