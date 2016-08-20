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

link_file_with_backup() {
  local filetolink=$1
  local targetname=$2
  local RIGHTNOW=$(date + "%Y-%m-%d-%H-%M-%S")

  if [[ -f $targetname ]]; then
    echo "backing up ${targetname} to ${targetname}.backup.${RIGHTNOW}"
    cp $targetname ${targetname}.backup
  fi

  echo "linking ${targetname}"
  ln -sf $filetolink $targetname
}

echo 'bootstrapping dotfiles'

# vim
link_file_with_backup $HOME/dotfiles/vim/vimrc $HOME/.vimrc

# tmux
link_file_with_backup $HOME/dotfiles/tmux/tmuxconf $HOME/.tmux.conf

# git
link_file_with_backup $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
link_file_with_backup $HOME/dotfiles/git/gitignore $HOME/.gitignore

# thymerc
link_file_with_backup $HOME/dotfiles/tools/thymerc $HOME/.thymerc

echo 'finished'
