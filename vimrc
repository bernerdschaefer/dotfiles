set nocompatible

" don't use other fancy shells within vim
set shell=/bin/bash

" set up golang plugin
set rtp+=/usr/local/go/misc/vim/

" set up protobuf plugin
set rtp+=$HOME/.vim/plugins/vim-protobuf/

" set up vimroom plugin
set rtp+=$HOME/.vim/plugins/vimroom/

syntax on
filetype plugin indent on

set directory=/tmp
set expandtab
set hidden
set history=1000
set incsearch
set list
set listchars=tab:▸\ ,trail:■
set path=.,**,,$GOPATH/src,$GOROOT/src/pkg
set showmode
set shiftwidth=2
set softtabstop=2
set suffixesadd=.rb,.go,.scala
set ruler
set title
set ttimeoutlen=50
set wildmenu
set wildmode=list:longest

" some custom colors
hi NonText      ctermfg=14 ctermbg=none
hi StatusLine   cterm=underline ctermfg=0 ctermbg=none
hi StatusLineNC cterm=underline ctermfg=14 ctermbg=none
hi Tabline      cterm=none
hi TablineFill  cterm=none ctermbg=7
hi TablineSel   cterm=bold ctermfg=4 ctermbg=none
hi VertSplit    cterm=bold ctermfg=14 ctermbg=none

" go indendation display settings
au BufRead,BufNewFile *.go            setlocal makeprg=go\ build noet ts=2 sw=2 listchars=tab:\ \ ,trail:■
au BufRead,BufNewFile *.{h,hpp,c,cpp} setlocal noet ts=2 sw=2 listchars=tab:\ \ ,trail:■

" default .md to markdown
au BufRead,BufNewFile *.{md,markdown} setlocal ft=markdown
au BufRead,BufNewFile *.{md,markdown} syntax match Comment /\%^---\_.\{-}---$/

let g:vimroom_ctermbackground='white'

" interrobangs‽
digraph !? 8253
digraph ?! 8253
