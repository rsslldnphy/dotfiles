function __fish_qq_repo_dirs
    ls -1 ~/Code
end

complete --no-files -c qq -a '(__fish_qq_repo_dirs)'
