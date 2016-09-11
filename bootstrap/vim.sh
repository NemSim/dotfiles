#!/bin/bash

echo 'bootstrapping vim'

if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
  echo 'cloning Vundle.vim'
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
  echo 'you did this in the wrong order. Vundle.vim wasnt cloned'
fi

echo 'installing plugins'
vim -u $HOME/.bundles.vim +PluginInstall +qall

echo 'finished'
