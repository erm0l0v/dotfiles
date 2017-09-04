#!/bin/bash

mkdir -p bash_helpers/
cp -R ~/bash_helpers/ bash_helpers/

cat ~/.profile | grep -v AWS > .profile
cp ~/.ideavimrc .ideavimrc
cp ~/.vimrc .vimrc
cp ~/.gitignore_global .gitignore_global
cp ~/.gitconfig .gitconfig

mkdir -p .config/nvim/
cp ~/.config/nvim/init.vim .config/nvim/init.vim
