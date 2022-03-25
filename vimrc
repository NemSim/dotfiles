""" FUNCTIONAL """

set nocompatible
filetype off

"""" (>'.')> vundle stuff BEGIN <('.'<) """
" http://www.gmarik.info/blog/2011/chicken-or-egg-dilemma/
" to install:
" $ vim -u bundles.vim +PluginInstall +qall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/DrawIt'

" Snippets
" Plugin 'SirVer/ultisnips' " engine
" the snippets
" found in ~/.vim/bundle/vim-snippets/snippets/extension.snippets
" Plugin 'honza/vim-snippets'

call vundle#end()
""" (>'.')> vundle stuff END <('.'<) """

" just regular filetype stuff
filetype plugin indent on
syntax on
syntax enable

" enable mouse
set mouse=a

" j(j|k) escapes insert mode
" inoremap jj <ESC>
" inoremap jk <ESC>

" comma as leader key
let mapleader = ','

set hls                        " highlight matches
set autoread                   " reload file in buffer if changed outside of vim
set autoindent                 " automatically indent when applicable
set backspace=indent,eol,start " normal backspace functionality
set directory-=.               " don't store swapfiles in the current directory
set encoding=utf-8             " always
set expandtab                  " expand tabs to spaces
set ignorecase                 " case-insensitive search
set incsearch                  " search as you type
set list                       " show trailing whitespace
set listchars=tab:▸\ ,trail:▫  " show tabs and trailing spaces
set number                     " show line numbers
set ruler                      " show where you are
set softtabstop=2              " insert mode tab and backspace use 2 spaces
set tabstop=2                  " actual tabs occupy 2 characters
set shiftwidth=2               " indent 2 columns of text with reindent operation
set laststatus=2               " always show statusline
set wildmode=list              " set wildmenu to list all matches

" override values to use tabs for python
" https://stackoverflow.com/questions/27993214/tabs-for-indentation-in-python-files-in-vim#27993262
augroup python_files
  autocmd!
  autocmd FileType python setlocal noexpandtab
  autocmd FileType python set tabstop=4
  autocmd FileType python set shiftwidth=4
augroup END

" make it nice and solarized
set background=dark
colorscheme solarized

" clipboard integration
set clipboard=unnamed

" reload vim config shortcut
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" vimwiki
"" wikis
"" every save updates:
""  generated HTML (auto_export: 1)
""  TOC (auto_toc: 1)
let g:vimwiki_list = [{'path':'/Users/nemanja/Stuff/vimwikis/default/', 'path_html':'/Users/nemanja/Stuff/vimwikis/default/',
      \'auto_export': 1, 'auto_toc': 1, 'auto_tags': 1}]
let g:vimwiki_list=[
      \{'path':'/Users/nemanja/Stuff/vimwikis/etc/', 'path_html':'/Users/nemanja/Stuff/vimwikis/html/etc/', 'auto_export':1, 'auto_toc':1, 'auto_tags':1},
      \{'path':'/Users/nemanja/Stuff/vimwikis/work/', 'path_html':'/Users/nemanja/Stuff/vimwikis/html/work/', 'auto_export':1, 'auto_toc':1, 'auto_tags':1}]


" add other wikis like so
"   {
"   'path':'~/.vimwikis/whatever/',
"   'path_html':'~/.vimwikis/whatever/',
"   'auto_export': 1,
"   'auto_toc': 1
"   }

" NerdTree
" auto open when vim starts up if no files specified
" $ vim
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close if only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" icons for git status in nerd tree
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "*",
      \ "Staged"    : "+",
      \ "Untracked" : "U",
      \ "Renamed"   : ">",
      \ "Unmerged"  : "=",
      \ "Deleted"   : "X",
      \ "Dirty"     : "x",
      \ "Clean"     : "o",
      \ "Unknown"   : "?"}

"" bindings
" general
nnoremap <leader>q :q<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tq :tabclose<CR>
" instead of gt and gT
nnoremap <leader>tt :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
vnoremap <leader>c :w !pbcopy<CR>
nnoremap <leader>vp :r !pbpaste<CR>
" vimwiki
nnoremap <leader>nt :VimwikiTabnewLink<CR>
nnoremap <leader>wgt :VimwikiGenerateTags<CR>
nnoremap <leader>wgl :VimwikiGenerateLinks<CR>
nnoremap <leader>wls :VimwikiVSplitLink<CR>
nnoremap <leader>wlh :VimwikiSplitLink<CR>
nnoremap <leader>wj :VimwikiDiaryNextDay<CR>
nnoremap <leader>wk :VimwikiDiaryPrevDay<CR>
nnoremap <leader>vwc :VimwikiTOC<CR>
nnoremap <leader>vwt :VimwikiTable<CR>
nnoremap <leader>wah :VimwikiAll2HTML<CR>

" toggle nerdtree in all tabs
nnoremap <leader>e :NERDTreeTabsToggle<CR>
nnoremap <leader>f :NERDTreeTabsFind<CR>

" CtrlP stuff
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" GitGutter line highlights
nnoremap <leader>gl :GitGutterLineHighlightsToggle<CR>

" tabular binding in visual mode
vnoremap <leader>t :Tabularize /

" narcissism
nnoremap <leader>nem :echo 'Nem rules!'<CR>

" more specific configs

" Use The Silver Searcher for search stuff
let g:ackprg = 'ag --nogroup --nocolor --column'

" set guifont=Hack
" set guifont=Sauce\ Code\ Powerline
" set guifont=Source\ Code\ Pro\ for\ Powerline
" disable airline separators
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_powerline_fonts=1

" use ack which has been configured to use ag
nnoremap <leader>a :Ack<space>

" snippets
" Trigger configuration
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" :UltiSnipsEdit splits window.
" let g:UltiSnipsEditSplit="vertical"

" gitgutter
" background of gitgutter
" black black white text
" let g:gitgutter_override_sign_column_highlight = 0
" highlight SignColumn ctermbg=black
" highlight SignColumn guibg=black
" highlight GitGutterAdd ctermbg=black
" highlight GitGutterAdd ctermfg=white
" highlight GitGutterChange ctermbg=black
" highlight GitGutterChange ctermfg=white
" highlight GitGutterDelete ctermbg=black
" highlight GitGutterDelete ctermfg=white
" highlight GitGutterChangeDelete ctermbg=black

let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '*~'
let g:gitgutter_sign_removed = 'xx'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'

" source any local vim-ery
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" bits stolen from:
" - https://github.com/square/maximum-awesome
