#!/bin/bash -e

DOTFILES=(ackrc aliases bash bash_profile bin gitconfig inputrc prompt vimrc vim);
DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd)"

echo "*****************************************"
echo "******* rsslldnphy/dotfiles setup *******"
echo "*****************************************"
echo

echo "*********** linking dotfiles ************"
for f in "${DOTFILES[@]}"; do
  source="$DOTFILES_DIR/$f";
  dest="$HOME/.$f";
  printf 'Linking %-41s to %s\n' $source $dest;
  [ -L $dest ] || ln -s $source $dest;
done;
echo

echo "Done"
