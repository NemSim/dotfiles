#!/bin/bash

echo 'bootstrapping...'

if [[ ! -d $HOME/dotfiles ]]; then
  echo "no dotfiles folder found at ${HOME}/dotfiles"
  echo "aborting bootstrap operation"
  exit 1
fi

if [[ "$PWD" == *bootstrap ]]; then
  echo "run bootstrap from parent directory"
  echo "aborting bootstrap operation"
  exit 1
fi

source "$PWD/bootstrap/tools.sh"
source "$PWD/bootstrap/shell-bash.sh"
source "$PWD/bootstrap/dotfiles.sh"
source "$PWD/bootstrap/vim.sh"

echo 'finished bootstrapping'
