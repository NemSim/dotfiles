#!/bin/bash

echo '-----------------------'
echo '- setting up dotfiles -'
echo '-----------------------'
echo ''
echo 'initializing ...'
echo ''

echo 'options:'
echo ' 1 - link all dotfiles and install suggested tools'
echo ' 2 - link all dotfiles'
echo ' 3 - install suggested tools'
echo ''
echo -n 'what do you want to do? > '
read bootstrap_selection

echo 'you chose: '
echo $bootstrap_selection


echo '... cool'
echo '// TODO: finish this'
# TODO features
# - should support bash, zsh, csh
# - minimal mode (for like a server, might only want a prompt or shortcuts)
# - should prompt to install tools
# - things that use tools (tmux uses thyme which requires ruby) should not fail if dependency isn't installed
