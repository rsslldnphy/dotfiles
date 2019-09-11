#!/usr/bin/env bash

ln -sf $(pwd)/ackrc ~/.ackrc
ln -sf $(pwd)/gitconfig ~/.gitconfig

# install vim-plug
if [ ! -f ~/.config/nvim/autoload/plug.vim ]; then
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p ~/.config

ln -sf $(pwd)/tmux.conf ~/.tmux.conf

rm -rf ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config/nvim

mkdir -p ~/.config/fish

ln -sf $(pwd)/fish/aliases.fish ~/.config/fish/aliases.fish
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish

rm -rf ~/.config/fish/functions
ln -sf $(pwd)/fish/functions ~/.config/fish/functions

rm -rf ~/.config/fish/completions
ln -sf $(pwd)/fish/completions ~/.config/fish/completions

