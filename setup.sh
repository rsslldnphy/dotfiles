#!/bin/bash -e

# echo "*** Installing some essentials from Homebrew"
# brew install cowsay elasticsearch figlet fish git || true
# brew install hub jq leiningen nginx rbenv rlwrap || true
# brew install sl tmux tree reattach-to-user-namespace || true
# brew install macvim    --with-override-system-vim || true
# brew install coreutils --with-default-names || true
# brew install emacs || true

# echo "*** Installing essential gems"
# sudo gem install lolcat

# echo "*** Creating symbolic links"

mkdir -p ~/.emacs.d
for f in ackrc gitconfig config/fish/config.fish config/fish/functions config/fish/completions emacs.d/init.el tmux.conf vim vimrc; do
  source="$(pwd)/$f"
  dest="$HOME/.$f"
  echo "Linking $source to $dest"
  [ -L $dest ] || ln -s $source $dest
done

echo "Done"
