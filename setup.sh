#!/bin/bash -e

echo "*** Installing some essentials from Homebrew"
brew install cowsay elasticsearch figlet fish git
brew install hub jq leiningen nginx rbenv sl tmux
brew install tree reattach-to-user-namespace
brew install macvim    --with-override-system-vim
brew install coreutils --with-default-names

echo "*** Installing essential gems"
sudo gem install lolcat

echo "*** Creating symbolic links"

for f in ackrc gitconfig config/fish/config.fish config/fish/functions config/fish/completions tmux.conf vim vimrc; do
  source="$(pwd)/$f"
  dest="$HOME/.$f"
  echo "Linking $source to $dest"
  [ -L $dest ] || ln -s $source $dest
done

echo "Done"
