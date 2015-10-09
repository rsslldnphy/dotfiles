#!/bin/bash -e

DOTFILES=(ackrc aliases bash bash_profile bin gitconfig inputrc prompt vimrc vim);
DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd)"

echo "*****************************************"
echo "******* rsslldnphy/dotfiles setup *******"
echo "*****************************************"
echo

echo "*********** Linking dotfiles ************"
for f in "${DOTFILES[@]}"; do
  source="$DOTFILES_DIR/$f";
  dest="$HOME/.$f";
  printf 'Linking %-41s to %s\n' $source $dest;
  [ -L $dest ] || ln -s $source $dest;
done;
echo

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
