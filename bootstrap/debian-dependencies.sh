#!/bin/bash

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get upgrade\
  git vim tmux silversearcher-ag task gcc\
  bzip2 sqlite3 rcm gcc autoconf bison\
  build-essential libssl-dev libyaml-dev libreadline6-dev\
  zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

