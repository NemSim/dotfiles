#!/bin/bash

sudo apt-get update
sudo apt-get upgrade git vim tmux task
sudo apt-get install\
  silversearcher-ag gcc software-properties-common\
  bzip2 sqlite3 autoconf bison build-essential\
  libssl-dev libyaml-dev libreadline6-dev\
  zlib1g-dev libncurses5-dev libffi-dev libgdbm3\
  libgdbm-dev

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get install rcm
