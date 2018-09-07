function release-notes
	git log  $argv[1]...$argv[2] | awk '/Merge pull request/{printf "%5s",$4; getline; getline; print}'
end
