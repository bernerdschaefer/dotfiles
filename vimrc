set nocompatible

" don't use other fancy shells within vim
set shell=/bin/bash

" inject plugins into runtime path, keeping standard
" after/ paths at the end
set rtp-=$VIM/vimfiles/after,$HOME/.vim/after
set rtp+=$HOME/.vim/plugins/*,$VIM/vimfiles/after,$HOME/.vim/after

syntax on
filetype plugin indent on

set backspace=start " allow backspace in insert mode (single line)
set directory=/tmp
set expandtab
set hidden
set history=1000
set incsearch
set list
set listchars=tab:▸\ ,trail:■
set path=.,**,,
set showmode
set shiftwidth=2
set softtabstop=2
set suffixesadd=.rb,.go,.scala,.clj
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

" generate help tags for configured plugins with:
"   :call PluginHelpTags()
function! PluginHelpTags()
  for doc in split(globpath("$HOME/.vim/plugins/", '**/doc'), '\n')
    silent! execute 'helptags' doc
  endfor
endfunction
