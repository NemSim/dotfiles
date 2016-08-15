#!/bin/bash

# parts of this were borrowed from
# https://github.com/tscheffe/dotfiles/blob/master/bootstrap/apps.sh
program_exists() {
  type $1 > /dev/null 2>&1
}

echo 'bootstrapping tools'

# ag - the silver searcher
# https://github.com/ggreer/the_silver_searcher
if ! program_exists ag; then
  echo 'you need to install ag - the silver searcher'
  echo 'see: https://github.com/ggreer/the_silver_searcher'
  exit 1
else
  echo 'ag found'
fi

# ruby manager?
# TODO

# thyme - pomodoro timer
# (requires ruby)
# https://github.com/hughbien/thyme
# TODO

echo 'finished'
