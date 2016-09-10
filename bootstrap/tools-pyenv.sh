#!/bin/bash

echo 'bootstrapping pyenv'

# pyenv python manager
if ! program_exists pyenv; then
  echo 'cloning pyenv'
  git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
  echo 'finished'
else
  echo 'pyenv found'
fi

source "$HOME/.bashrc"

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
