set nocompatible
filetype off
"
""" (>'.')> vundle stuff BEGIN <('.'<) """
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
"TODO replace old ag plugin with this?
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-ruby/vim-ruby'

" Snippets
Plugin 'SirVer/ultisnips' " engine
"   the snippets
"   found in ~/.vim/bundle/vim-snippets/snippets/extension.snippets
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on
