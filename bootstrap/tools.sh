#!/bin/bash

# pattern "borrowed" from
# https://github.com/tscheffe/dotfiles/blob/master/bootstrap/apps.sh
program_exists() {
  type $1 > /dev/null 2>&1
}

echo 'bootstrapping tools'

#if ! program_exists derp; then
#  echo 'you need to install derp!'
#  echo 'derp.co/install'
#  exit 1
#else
#  echo 'you have this'
#fi

# if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
#   echo 'cloning Vundle.vim'
#   git clone git@github.com:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# fi

echo 'finished'
