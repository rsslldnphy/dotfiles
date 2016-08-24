#!/bin/bash -e

echo "*** Installing some essentials from Homebrew"
brew install cowsay elasticsearch fish git hub jq   2> /dev/null
brew install leiningen nginx rbenv sl tmux tree     2> /dev/null
brew install macvim    --with-override-system-vim   2> /dev/null
brew install coreutils --with-default-names         2> /dev/null


echo "*** Installing essential gems"
sudo gem install lolcat

echo "*** Creating symbolic links"

for f in ackrc fishrc gitconfig config/fish/config.fish config/fish/functions config/fish/completions tmux.conf vim vimrc; do
  source="$(pwd)/$f"
  dest="$HOME/.$f"
  echo "Linking $source to $dest"
  [ -L $dest ] || ln -s $source $dest
done

echo "Done"
