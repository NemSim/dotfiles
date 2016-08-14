# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# applications (e.g. rbenv setup)
if [ -f ~/.bash_applications ]; then
	. ~/.bash_applications
fi

# source "./tools/z/z.sh"
# RBENV stuff
# git clone https://github.com/sstephenson/rbenv.git INTO ~/.rbenv
# git clone https://github.com/sstephenson/ruby-build.git INTO ~/.rbenv/plugins/ruby-build

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
