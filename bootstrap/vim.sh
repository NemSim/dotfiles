#!/bin/bash

echo 'bootstrapping vim'

if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
  echo 'cloning Vundle.vim'
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

echo 'finished'
