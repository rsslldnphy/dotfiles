#!/usr/bin/env bash

brew bundle

mkdir -p ~/.config

# misc
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/ackrc ~/.ackrc

# fish
if ! cat /etc/shells|grep fish >/dev/null; then
    echo $(which fish) | sudo tee --append /etc/shells;
    chsh -s $(which fish)
fi



mkdir -p ~/.config/fish
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish
fish $(pwd)/fish/abbreviations.fish

ln -sf $(pwd)/starship.toml ~/.config/starship.toml

mkdir -p ~/.config/fish/functions
ln -sf $(pwd)/fish/functions/git-trash.fish ~/.config/fish/functions/git-trash.fish

# karabiner
mkdir -p ~/.config/karabiner
ln -sf $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json

echo
echo TODO:
echo " - Install '0xProto Nerd Font' from https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/0xProto.zip"
