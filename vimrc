""" SETUP """
"" $ vim +PluginInstall +qall

""" FUNCTIONAL """

syntax enable

""" (>'.')> vundle <('.'<) """
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kchmck/vim-coffee-script'

" figure these out?
"Plugin 'scrooloose/syntastic'
"Plugin 'vim-ruby/vim-ruby'


call vundle#end()
filetype plugin indent on

inoremap jj <ESC>

" it seems silly to disregard mice altogether
set mouse=a

" Support resizing in tmux
if exists('$TMUX')
  set ttymouse=xterm2
endif

set autoindent

" syntastic recommended defaults, change up
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" above this?

" \/ research this? seems sketchy
"set backupcopy=yes              " see :help crontab
set directory-=.               " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                  " expand tabs to spaces
set ignorecase                 " case-insensitive search
set incsearch                  " search as you type
set list                       " show trailing whitespace
set listchars=tab:▸\ ,trail:▫  " beep
set number                     " show line numbers
set ruler                      " show where you are

set softtabstop=2 " insert mode tab and backspace use 2 spaces
set tabstop=2     " actual tabs occupy 2 characters
set shiftwidth=2

" make sure Python tabs work
" but it doesn't work
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set wildmenu
set wildmode=list

" makes it a lil easier to navigate vim panes in tmux without leaving vim
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

let mapleader = ','
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>n :echo 'Nem rules!'<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
nnoremap <leader>a :Ag<space>
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


""" SUPERFICIAL """
" TODO: make this be a subtle color
"set colorcolumn=80

" support a different colorscheme on iTerm but don't use it because it's silly
if (&t_Co == 256 || has('gui_running'))
  if ($TERM_PROGRAM == 'iTerm.app')
    "set background=dark
    "colorscheme solarized
  else
    "colorscheme desert
  endif
endif

" source any local vim-ery
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Bits stolen from:
" - https://github.com/square/maximum-awesome
