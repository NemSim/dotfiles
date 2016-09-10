set nocompatible
filetype off
"
""" (>'.')> vundle stuff BEGIN <('.'<) """
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vimwiki/vimwiki'

" Snippets
Plugin 'SirVer/ultisnips' " engine
"   the snippets
"   found in ~/.vim/bundle/vim-snippets/snippets/extension.snippets
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on
