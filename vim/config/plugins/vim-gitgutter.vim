" Copyright (C) 2022. All rights reserved.
" File name   : vim-gitgutter.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : vim-gitgutter configuration file


augroup load_gitgutter
    autocmd!
    autocmd InsertEnter * call plug#load('vim-gitgutter') | autocmd! load_gitgutter
augroup END

let g:gitgutter_signs = 0			" close display
let g:gitgutter_max_signs = 2000

" EOF

