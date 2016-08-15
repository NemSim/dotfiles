#!/bin/bash

# parts of this were borrowed from
# https://github.com/tscheffe/dotfiles/blob/master/bootstrap/apps.sh
program_exists() {
  type $1 > /dev/null 2>&1
}

echo 'bootstrapping tools'

# tools directory
if [[ ! -d $HOME/.nem-tools ]]; then
  echo 'creating ~/.nem-tools'
  mkdir $HOME/.nem-tools
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

# rbenv ruby manager
if ! program_exists rbenv; then
  echo 'you need to install rbenv'
  exit 1
  # TODO
  # git clone git@github.com:sstephenson/rbenv.git $HOME/.rbenv
else
  echo 'rbenv found'
fi

if program_exists rbenv; then
  echo 'installing rbenv plugins'
  # git clone git@github.com:sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  # git clone git@github.com:sstephenson/rbenv-default-gems.git $HOME/.rbenv/plugins/rbenv-default-gems

  # install a newish ruby, not here though?
  # rbenv install 2.2.0
  # set it as global
  # rbenv global 2.2.0
else
  echo 'rbenv not found?'
fi

# TODO install this as a default gem
# thyme - pomodoro timer
# (requires ruby)
if ! program_exists thyme; then
  echo 'you need to install thyme'
  echo 'see: https://github.com/hughbien/thyme'
  exit 1
else
  echo 'thyme found'
fi

echo 'finished'
