#!/bin/bash

sudo apt-get update
sudo apt-get install git vim tmux task
sudo apt-get install\
  silversearcher-ag gcc software-properties-common\
  bzip2 sqlite3 autoconf bison build-essential\
  libssl-dev libyaml-dev libreadline6-dev\
  zlib1g-dev libncurses5-dev libffi-dev libgdbm3\
  libgdbm-dev g++-multilib

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get install rcm

echo 'you should do an apt-get upgrade'
echo 'to be sure everything is up-to date'
