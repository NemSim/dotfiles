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

# TODO refactor

echo 'bootstrapping dotfiles'

# TODO git

if [[ -f $HOME/.vimrc ]]; then
  echo "backing up .vimrc to ${HOME}/.vimrc.backup"
  cp $HOME/.vimrc $HOME/.vimrc.backup
fi

ln -sf $HOME/dotfiles/vim/vimrc $HOME/.vimrc

if [[ -f $HOME/.tmux.conf ]]; then
  echo "backing up .tmux.conf to ${HOME}/.tmux.conf.backup"
  cp $HOME/.tmux.conf $HOME/.tmux.conf.backup
fi

ln -sf $HOME/dotfiles/tmux/tmuxconf $HOME/.tmux.conf

echo 'finished'
