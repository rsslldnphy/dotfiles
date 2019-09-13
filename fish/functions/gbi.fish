function gbi
 set BRANCH_NAME issue-(git issue | fzf | sed -E 's/[^0-9]*#([0-9]+)[^0-9]*/\1/')
 git show-ref -q --heads $BRANCH_NAME && git checkout $BRANCH_NAME || git checkout -b $BRANCH_NAME
end

