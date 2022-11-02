" Copyright (C) 2022. All rights reserved.
" File name   : vim-multiple-cursors.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : vim-multiple-cursors configuration file


" vim-multiple-cursors conflict with vim-configure
" set selection=exclusive
" set selectmode=mouse,key

" Vim has Alt key problem
let g:multi_cursor_use_default_mapping = 0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-p>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-p>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" EOF

