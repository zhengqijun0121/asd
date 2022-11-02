" Copyright (C) 2019. All rights reserved.
" File name   : terminal.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : vim terminal configuration


" Quickly change font size in GUI {
    command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
    command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
" } Quickly change font size in GUI

" Change cursor style dependent on mode {
    " 光标格式
    " if empty($TMUX)
    "   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    "   let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    " else
    "   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    "   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    "   let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    " endif
" } Change cursor style dependent on mode

" Fix the problem of character display [ >4;m ]
" :h modifyOtherKeys
let &t_TI = ""
let &t_TE = ""

" EOF

