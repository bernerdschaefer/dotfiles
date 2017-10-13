" Name:       null.vim
" Version:    0.1
" Maintainer: github.com/bernerdschaefer
" License:    The MIT License (MIT)
"
" A colorscheme meant to look like a more pleasant version of syntax off.
"
"""

hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name='null'

" some custom colors
hi IncSearch    cterm=reverse
hi NonText      ctermfg=14 ctermbg=none
hi StatusLine   cterm=underline ctermfg=14 ctermbg=none
hi StatusLineNC cterm=underline ctermfg=0 ctermbg=none
hi Tabline      cterm=none
hi TablineFill  cterm=none ctermbg=7
hi TablineSel   cterm=bold ctermfg=4 ctermbg=none
hi VertSplit    cterm=bold ctermfg=14 ctermbg=none
hi Visual       cterm=reverse
hi Comment      cterm=italic ctermfg=grey ctermbg=none

hi ColorColumn    cterm=none ctermfg=none ctermbg=none
"hi Comment        cterm=none ctermfg=none ctermbg=none
hi Conceal        cterm=none ctermfg=none ctermbg=none
hi Constant       cterm=none ctermfg=none ctermbg=none
hi CursorColumn   cterm=none ctermfg=none ctermbg=none
hi CursorLine     cterm=none ctermfg=none ctermbg=none
hi CursorLineNr   cterm=none ctermfg=none ctermbg=none
hi DiffAdd        cterm=none ctermfg=none ctermbg=none
hi DiffChange     cterm=none ctermfg=none ctermbg=none
hi DiffDelete     cterm=none ctermfg=none ctermbg=none
hi DiffText       cterm=none ctermfg=none ctermbg=none
hi Directory      cterm=none ctermfg=none ctermbg=none
hi Error          cterm=none ctermfg=none ctermbg=none
hi ErrorMsg       cterm=none ctermfg=none ctermbg=none
hi FoldColumn     cterm=none ctermfg=none ctermbg=none
hi Folded         cterm=none ctermfg=none ctermbg=none
hi Identifier     cterm=none ctermfg=none ctermbg=none
hi Ignore         cterm=none ctermfg=none ctermbg=none
hi LineNr         cterm=none ctermfg=none ctermbg=none
hi MatchParen     cterm=none ctermfg=none ctermbg=none
hi ModeMsg        cterm=none ctermfg=none ctermbg=none
hi MoreMsg        cterm=none ctermfg=none ctermbg=none
hi Pmenu          cterm=none ctermfg=none ctermbg=none
hi PmenuSbar      cterm=none ctermfg=none ctermbg=none
hi PmenuSel       cterm=none ctermfg=none ctermbg=none
hi PmenuThumb     cterm=none ctermfg=none ctermbg=none
hi PreProc        cterm=none ctermfg=none ctermbg=none
hi Question       cterm=none ctermfg=none ctermbg=none
hi Search         cterm=none ctermfg=none ctermbg=none
hi SignColumn     cterm=none ctermfg=none ctermbg=none
hi Special        cterm=none ctermfg=none ctermbg=none
hi SpecialKey     cterm=none ctermfg=none ctermbg=none
hi SpellBad       cterm=none ctermfg=none ctermbg=none
hi SpellCap       cterm=none ctermfg=none ctermbg=none
hi SpellLocal     cterm=none ctermfg=none ctermbg=none
hi SpellRare      cterm=none ctermfg=none ctermbg=none
hi Statement      cterm=none ctermfg=none ctermbg=none
hi TabLine        cterm=none ctermfg=none ctermbg=none
hi TabLineFill    cterm=none ctermfg=none ctermbg=none
hi TabLineSel     cterm=none ctermfg=none ctermbg=none
hi Title          cterm=none ctermfg=none ctermbg=none
hi Todo           cterm=none ctermfg=none ctermbg=none
hi Type           cterm=none ctermfg=none ctermbg=none
hi Underlined     cterm=none ctermfg=none ctermbg=none
hi VisualNOS      cterm=none ctermfg=none ctermbg=none
hi WarningMsg     cterm=none ctermfg=none ctermbg=none
hi WildMenu       cterm=none ctermfg=none ctermbg=none
