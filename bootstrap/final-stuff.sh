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

# mandatory

# solarized ls
echo 'setting up solarized dircolors'
git clone https://github.com/seebi/dircolors-solarized $HOME/.nem-tools/dircolors-solarized
cp $HOME/.nem-tools/dircolors-solarized/dircolors.256dark $HOME/.dircolors
echo 'solarized dircolors'

if program_exists vim; then
  echo 'installing vim plugins'
  vim -u $HOME/dotfiles/vim/bundles.vim +PluginInstall +qall
else
  echo 'vim not found'
fi

# TODO make optional below this point

rbenv_path=${RBENV_ROOT:-$HOME/.rbenv}
rbenv_plugins_path=$rbenv_path/plugins

ensure_exists $rbenv_path
ensure_exists $rbenv_plugins_path

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

# install a newish and a new oldish python
if program_exists pyenv; then
  echo 'installing python 3.5.2'
  pyenv install -s 3.5.2
  pyenv global 3.5.2
  echo 'installing python 2.7.12'
  pyenv install -s 2.7.12
else
  echo 'pyenv not found?'
fi

# install pip3 stuff
echo 'you might want to'
echo 'pip3 install'
echo ' - asciinema'
echo ' - jupyter'

echo 'finished'
