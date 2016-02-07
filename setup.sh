#!/bin/bash -e

echo "*****************************************"
echo "******* rsslldnphy/dotfiles setup *******"
echo "*****************************************"
echo

echo "*********** Linking dotfiles ************"
DOTFILES=(ackrc aliases bash bash_profile bin cvsignore gitconfig inputrc octaverc prompt spacemacs vimrc vim);
DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd)"
for f in "${DOTFILES[@]}"; do
  source="$DOTFILES_DIR/$f";
  dest="$HOME/.$f";
  printf 'Linking %-41s to %s\n' $source $dest;
  [ -L $dest ] || ln -s $source $dest;
done;
echo;

echo "*********** Linking dotfiles ************"
EMACSFILES=(init.el Cask);
for f in "${EMACSFILES[@]}"; do
  source="$DOTFILES_DIR/$f";
  dest="$HOME/.emacs.d/$f";
  printf 'Linking %-41s to %s\n' $source $dest;
  [ -L $dest ] || ln -s $source $dest;
done;
cd $HOME/.emacs.d/ && cask install

echo "*********** Customizing OSX *************"
echo "Use tap-to-click on login screen"
sudo defaults write /Library/Preferences/.GlobalPreferences com.apple.mouse.tapBehavior -int 1

# echo "Hiding Spotlight icon"
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

echo "Hiding Time Machine icon"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  sudo defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
done

echo "Disabling annoying backswipe in Chrome"
sudo defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

echo

echo "Done"
