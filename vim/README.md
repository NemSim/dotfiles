# nem's vimrc

```
vundle package manager
in bundles.vim:
  Plugin 'foo/bar'


leader key:                    ,


,V - reloads vimrc
,s - switch between light and dark theme

scrooloose/nerdtree
  bring up NERDTree:          ,d

'kien/ctrlp.vim'
  fuzzy find directory:       ,t
  fuzzy find buffer:          ,b

'mileszs/ack.vim'
  search with ag:             ,a

'tpope/vim-surround'
  surround.vim:
  examples:
  change double quotes with single: cs"'
  change single quote with tags: cs'<q>
  change tags to quotes: cst"
  remove quotes: ds"
  surround word with []: ysiw]
  (iw) - text object
  wrap line in parens: yssb | yss)
  select mode wrap in: S"

'tpope/vim-commentary'
  gcc                - comment out a line
  gc(motion)         - comment selection
  gc (visual)        - (visual) comment selection
  :4,35Commentary    - comment lines 4,35
  :g/foo/Commentary  - comment foo

'easymotion/vim-easymotion'
  ,,s - single character search
```
