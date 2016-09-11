#!/bin/bash

source "$HOME/.bash_functions"

if program_exists rcup; then
  echo 'run this command:'
  echo 'rcup -v -d ~/dotfiles/.dotfiles'
else
  echo 'make sure you have rcm installed!'
  exit 1
fi
