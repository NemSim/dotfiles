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

echo 'bootstrapping bash shell'

# if [[ -f $HOME/.bashrc ]]; then
#   echo "backing up .bashrc to ${HOME}/.bashrc.backup"
#   cp $HOME/.bashrc $HOME/.bashrc.backup
# fi
#
# ln -sf $HOME/dotfiles/bash/bashrc $HOME/.bashrc

if [[ -f $HOME/.bash_aliases ]]; then
  echo "backing up .bash_aliases to ${HOME}/.bash_aliases.backup"
  cp $HOME/.bash_aliases $HOME/.bash_aliases.backup
fi
ln -sf $HOME/dotfiles/bash/bash_aliases $HOME/.bash_aliases

if [[ -f $HOME/.bash_applications ]]; then
  echo "backing up .bash_applications to ${HOME}/.bash_applications.backup"
  cp $HOME/.bash_applications $HOME/.bash_applications.backup
fi

ln -sf $HOME/dotfiles/bash/bash_applications $HOME/.bash_applications

echo 'finished'
