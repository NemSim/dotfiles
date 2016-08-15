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
source "$PWD/bootstrap/shell-bash.sh"
source "$PWD/bootstrap/dotfiles.sh"
source "$PWD/bootstrap/vim.sh"

echo 'finished bootstrapping'
