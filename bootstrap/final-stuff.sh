#!/bin/bash

# borrowed from
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

rbenv_path=${RBENV_ROOT:-$HOME/.rbenv}
rbenv_plugins_path=$rbenv_path/plugins

ensure_exists $rbenv_path
ensure_exists $rbenv_plugins_path

source $HOME/.bashrc

if program_exists rbenv; then
  echo "installing rbenv plugins to ${rbenv_plugins_path}"

  echo '... ruby-build'
  git clone git@github.com:sstephenson/ruby-build.git $rbenv_plugins_path/ruby-build
  echo '... complete'

  echo '... rbenv-default-gems'
  git clone git@github.com:sstephenson/rbenv-default-gems.git $rbenv_plugins_path/rbenv-default-gems
  echo '... complete'
else
  echo 'rbenv not found?'
fi

# install a newish ruby
if program_exists rbenv; then
  echo 'installing ruby 2.2.2'
  rbenv install 2.2.2
  rbenv global 2.2.2
else
  echo 'rbenv not found?'
fi

echo 'finished'
