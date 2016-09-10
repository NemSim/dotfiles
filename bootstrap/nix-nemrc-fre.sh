#!/bin/bash

echo 'bootstrapping...'

if [[ ! -d $HOME/dotfiles ]]; then
  echo 'dotfiles folder not found at ${HOME}/dotfiles'
  echo ' put the folder there and try again'
  echo 'aborting'
  exit 1
fi

if [[ "$PWD" == *bootstrap ]]; then
  echo 'run init.sh from dotfiles directory'
  echo ' (parent of this)'
  echo 'aborting'
  exit 1
fi

source "$PWD/bootstrap/tools.sh"

source "$PWD/bootstrap/dotfiles.sh"
echo 'sourcing bashrc...'
source "$HOME/.bashrc"

source "$PWD/bootstrap/vim.sh"
source "$PWD/bootstrap/final-stuff.sh"

echo 'finished bootstrapping'
