" Copyright (C) 2022. All rights reserved.
" File name   : undotree.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : undotree configuration file


if has("persistent_undo")
    set undodir=~/.vim/files/undodir/
    set undofile
endif

nnoremap <Leader>un :UndotreeToggle<CR>

" EOF

