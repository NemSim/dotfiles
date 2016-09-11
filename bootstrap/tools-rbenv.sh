#!/bin/bash

source "$HOME/.bashrc"

echo 'bootstrapping rbenv'

# rbenv ruby manager
if ! program_exists rbenv; then
  echo 'installing rbenv'
  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
else
  echo 'rbenv found'
fi

rbenv_path=${RBENV_ROOT:-$HOME/.rbenv}
rbenv_plugins_path=$rbenv_path/plugins

ensure_exists $rbenv_path
ensure_exists $rbenv_plugins_path

source "$HOME/.bashrc"

if program_exists rbenv; then
  echo "installing rbenv plugins to ${rbenv_plugins_path}"

  echo '... ruby-build'
  git clone https://github.com/sstephenson/ruby-build.git $rbenv_plugins_path/ruby-build
  echo '... complete'

  echo '... rbenv-default-gems'
  echo '... ... linking deafult gems file'
  ln -sf $HOME/dotfiles/rbenv/default-gems $rbenv_path/default-gems
  echo '... ... installing plugin'
  git clone https://github.com/sstephenson/rbenv-default-gems.git $rbenv_plugins_path/rbenv-default-gems
  echo '... complete'
else
  echo 'rbenv not found?'
fi

# install a newish ruby
if program_exists rbenv; then
  echo 'installing ruby 2.3.1'
  rbenv install 2.3.1
  rbenv global 2.3.1
else
  echo 'rbenv not found?'
fi

echo 'finished'
