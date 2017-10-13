set nocompatible

" don't use other fancy shells within vim
set shell=/bin/sh

" inject plugins into runtime path, keeping standard
" after/ paths at the end
set rtp-=$VIM/vimfiles/after,$HOME/.vim/after
set rtp+=$HOME/.vim/plugins/*,$VIM/vimfiles/after,$HOME/.vim/after

syntax on
colorscheme null
filetype plugin indent on

set backspace=start " allow backspace in insert mode (single line)
set directory=/tmp
set expandtab
set grepprg='ag'
set hidden
set history=1000
set incsearch
set list
set listchars=tab:▸\ ,trail:■
set nojoinspaces
set path=.,**,,
set ruler
set shiftwidth=2
set showmode
set softtabstop=2
set suffixesadd=.go,.scala,.clj,.rb,.haml
set tags+=.git/tags
set title
set ttimeoutlen=50
set wildignore+=*/target/classes/*
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/vendor/bundle/*
set wildmenu
set wildmode=list:longest

digraph ?! 8253 " ‽ - interrobang

" enable emacs key mappings on the command-line
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" resize splits when vim is resized
autocmd VimResized * wincmd =

" generate help tags for configured plugins with:
"   :call PluginHelpTags()
function! PluginHelpTags()
  for doc in split(globpath("$HOME/.vim/plugins/", '**/doc'), '\n')
    silent! execute 'helptags' doc
  endfor
endfunction
