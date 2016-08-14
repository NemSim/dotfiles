#!/bin/bash

# creates symbolic link:
#   to file at link-to-create
# ln -sf file link-to-create

# bashrc methods
# method_name() {
#   local arg1=$1
#   local arg2=$2
#   ...
#   echo "arg1 ${arg1} arg2 ${arg2}"
#   cp $HOME/$arg1 arg2
# }

echo 'bootstrapping...'

echo "${HOME}"
echo "${PWD}"

if [[ ! -d $HOME/dotfiles ]]; then
  echo "no dotfiles folder found at ${HOME}/dotfiles"
  echo "aborting bootstrap operation"
  exit 1
fi

# TODO ensure it's run from bootstrap directory
if [[ "$PWD" == *bootstrap ]]; then
  echo "run bootstrap from parent directory"
  echo "aborting bootstrap operation"
  exit 1
fi

# bash
source "$PWD/bootstrap/bash.sh"

# vim
source "$PWD/bootstrap/vim.sh"

# tmux
source "$PWD/bootstrap/tmux.sh"

echo 'finished!'
