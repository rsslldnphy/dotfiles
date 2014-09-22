#!/bin/bash

for d in `ls -1 vim/bundle`; do
  echo -n "Updating $d: "
  (cd vim/bundle/$d; git pull origin master -f; if [ -d doc ]; then vim -c "helptags doc|q"; fi )
done
