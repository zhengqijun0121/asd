" Copyright (C) 2019. All rights reserved.
" File name   : theme.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : vim theme configuration


" Background color
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" Color scheme
colorscheme molokai

" Enable 256 color
set t_Co=256

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" EOF

