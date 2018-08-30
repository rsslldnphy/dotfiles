#!/usr/bin/env bash

# install homebrew apps

brew tap Homebrew/bundle
brew bundle

ln -sf $(pwd)/gitconfig ~/.gitconfig

mkdir -p ~/.config
ln -sf $(pwd)/nvim    ~/.config/nvim

mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/fish/completions

ln -sf $(pwd)/fish/aliases.fish        ~/.config/fish/aliases.fish
ln -sf $(pwd)/fish/config.fish         ~/.config/fish/config.fish
ln -sf $(pwd)/fish/functions/qq.fish   ~/.config/fish/functions/qq.fish
ln -sf $(pwd)/fish/completions/qq.fish ~/.config/fish/completions/qq.fish
