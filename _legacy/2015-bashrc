#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export EDITOR=vim
# export TERMINAL="xfce4-terminal"

PS1='[\u@\h \w]\n\$ '

# stack (haskell) stuff
export PATH="$PATH:$HOME/.local/bin"

# aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

eval "$(rbenv init -)"

# pyenv
if [ -d "$HOME/.pyenv" ]; then
  export PATH="$PATH:$HOME/.pyenv/bin"
fi

eval "$(pyenv init -)"

complete -W "$(teamocil --list)" teamocil
