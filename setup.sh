#!/bin/bash -e

brew install fish 2> /dev/null

ln -sf $(pwd)/vim            ~/.vim
ln -sf $(pwd)/vimrc          ~/.vimrc
ln -sf $(pwd)/gitconfig      ~/.gitconfig
ln -sf $(pwd)/fish/functions ~/.config/fish/functions

curl -fLo vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
