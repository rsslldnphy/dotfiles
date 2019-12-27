function apikey
  security find-generic-password -a (whoami) -s "$argv[1]-api" -w
end
