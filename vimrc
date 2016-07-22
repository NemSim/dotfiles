""" SETUP """
"" $ vim +PluginInstall +qall
"
" Reference
" ---------
" leader key:                 ,
" bring up NERDTree:          ,d
" search with ag:             ,a
" fuzzy find directory:       ,t
" fuzzy find buffer:          ,b
" swap light and dark themes: ,s
"
" surround.vim:
" examples:
" change double quotes with single: cs"'
" change single quote with tags: cs'<q>
" change tags to quotes: cst"
" remove quotes: ds"
" surround word with []: ysiw]
" (iw) - text object
" wrap line in parens: yssb | yss)
" select mode wrap in: S"
"
" easymotion:
" ,,s - does single character search
"
" comment:
" ,cc - comment selection
" ,cu - uncomment selection

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
Plugin 'vim-ruby/vim-ruby'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

inoremap jj <ESC>
inoremap jk <ESC>

" it seems silly to disregard mice altogether
set mouse=a

" snippets
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" background of gitgutter
" black black white text
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=black
highlight SignColumn guibg=black
highlight GitGutterAdd ctermbg=black
highlight GitGutterAdd ctermfg=white
highlight GitGutterChange ctermbg=black
highlight GitGutterChange ctermfg=white
highlight GitGutterDelete ctermbg=black
highlight GitGutterDelete ctermfg=white
highlight GitGutterChangeDelete ctermbg=black

let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '*~'
let g:gitgutter_sign_removed = 'xx'

" Support resizing in tmux
"if exists('$TMUX')
  "set ttymouse=xterm2
"endif

set autoindent

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
nnoremap <leader>nem :echo 'Nem rules!'<CR>
nnoremap <leader>s :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <leader>c :echo 'autocomplete'<CR>
"nnoremap <C-b> :make<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
nnoremap <leader>a :Ag<space>
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


""" SUPERFICIAL """

" statusline always
:set laststatus=2

" TODO: make this be a subtle color
"set colorcolumn=80

"set background=light
set background=dark
colorscheme solarized

" support a different colorscheme on iTerm but don't use it because it's silly
"if (&t_Co == 256 || has('gui_running'))
  "if ($TERM_PROGRAM == 'iTerm.app')
    "set background=dark
    "colorscheme solarized
  "else
    "colorscheme desert
  "endif
"endif

" plugin/highlight.vim
"set hlsearch
"set number

" source any local vim-ery
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Bits stolen from:
" - https://github.com/square/maximum-awesome

" copypasta from statusline to work with everything
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
