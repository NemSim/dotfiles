# bootstrap scripts

## get basic dependencies
```
bootstrap/ubuntu-dependencies.sh
```

## link dotfiles
```
bootstrap/dotfiles.sh
```

## set up vundle and install vim plugins
requires:
* git
* dotfiles linked
```
bootstrap/vim.sh
```

## install rbenv stuff
requires:
* git
* dotfiles linked
```
bootstrap/tools-rbenv.sh
```

## install pyenv stuff
requires:
* git
* dotfiles linked
```
bootstrap/tools-pyenv.sh
```
