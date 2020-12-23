#!/usr/bin/env bash

mkdir -p ~/.config

# misc
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/ackrc ~/.ackrc

# fish
mkdir -p ~/.config/fish
ln -sf $(pwd)/fish/aliases.fish ~/.config/fish/aliases.fish
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -sf $(pwd)/fish/functions ~/.config/fish/functions

# neovim
rm -rf ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config/nvim

# karabiner
ln -sf $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json

# install vim-plug
if [ ! -f ~/.config/nvim/autoload/plug.vim ]; then
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
