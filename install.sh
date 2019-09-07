#!/usr/bin/env bash

ln -sf $(pwd)/ackrc ~/.ackrc
ln -sf $(pwd)/gitconfig ~/.gitconfig

# install vim-plug
if [ ! -f ~/.config/nvim/autoload/plug.vim ]; then
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p ~/.config
ln -sf $(pwd)/nvim    ~/.config/nvim

mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/fish/completions

ln -sf $(pwd)/fish/aliases.fish        ~/.config/fish/aliases.fish
ln -sf $(pwd)/fish/config.fish         ~/.config/fish/config.fish
ln -sf $(pwd)/fish/functions/qq.fish   ~/.config/fish/functions/qq.fish
ln -sf $(pwd)/fish/completions/qq.fish ~/.config/fish/completions/qq.fish
