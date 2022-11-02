" Copyright (C) 2022. All rights reserved.
" File name   : limelight.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : limelight configuration file


" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

nnoremap <Leader>ll :Limelight!!<CR>
xnoremap <Leader>ll :Limelight!!<CR>

" EOF

