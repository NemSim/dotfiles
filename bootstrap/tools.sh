#!/bin/bash

# parts of this were borrowed from
# https://github.com/tscheffe/dotfiles/blob/master/bootstrap/apps.sh
program_exists() {
  type $1 > /dev/null 2>&1
}

ensure_exists() {
  if [[ ! -d $1 ]]; then
    echo "creating ${1}"
    mkdir $1
  fi
}

echo 'bootstrapping tools'

# tools directory
ensure_exists $HOME/.nem-tools



# git
if ! program_exists git; then
  echo 'you need to install git'
  exit 1
else
  echo 'git found'
fi

# vim
if ! program_exists vim; then
  echo 'you need to install vim'
  exit 1
else
  echo 'vim found'
fi

# tmux
if ! program_exists tmux; then
  echo 'you need to install tmux'
  exit 1
else
  echo 'tmux found'
fi

# ag - the silver searcher
# https://github.com/ggreer/the_silver_searcher
if ! program_exists ag; then
  echo 'you need to install ag - the silver searcher'
  echo 'see: https://github.com/ggreer/the_silver_searcher'
  exit 1
else
  echo 'ag found'
fi

# taskwarrior - cli task manager
if ! program_exists task; then
  echo 'you should install taskwarrior'
  echo 'see: https://taskwarrior.org/download/'
fi

# qalc
if ! program_exists qalc; then
  echo 'you should install qalc'
fi

# rbenv ruby manager
if ! program_exists rbenv; then
  echo 'installing rbenv'
  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
else
  echo 'rbenv found'
fi

# pyenv python manager
if ! program_exists pyenv; then
  echo 'installing pyenv'
  git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
  echo 'finished'
else
  echo 'pyenv found'
fi
