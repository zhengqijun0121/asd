" Copyright (C) 2019. All rights reserved.
" File name   : filetype.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : vim file type list


" iamcco/markdown-preview {
    augroup markdowngroup
        autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
        autocmd BufRead,BufNewFile COMMIT_EDITMSG set filetype=txt
    augroup END
" }

" EOF

