#!/bin/bash

echo 'bootstrapping...'

echo "${HOME}"
echo "${PWD}"

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

source "$PWD/bootstrap/shell-bash.sh"
source "$PWD/bootstrap/dotfiles.sh"
source "$PWD/bootstrap/vim.sh"
source "$PWD/bootstrap/tools.sh"

echo 'finished!'
