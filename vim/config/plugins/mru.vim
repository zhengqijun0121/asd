" Copyright (C) 2022. All rights reserved.
" File name   : mru.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : mru configuration file


if empty(glob('~/.vim/files/mru/vim_mru_files'))
    if empty(glob('~/.vim/files/mru'))
        silent !mkdir -p ~/.vim/files/mru
    endif
    silent !touch ~/.vim/files/mru/vim_mru_files
endif

highlight link MRUFileName LineNr

let g:MRU_File = $HOME.'/.vim/files/mru/vim_mru_files'
let g:MRU_Max_Entries = 1000
let g:MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'    " For Unix
let g:MRU_Window_Height = 15

nnoremap <Leader>mr :MRU<CR>

" EOF

