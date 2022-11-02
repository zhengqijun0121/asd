" Copyright (C) 2022. All rights reserved.
" File name   : vimtex.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : vimtex configuration file


let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0

" Configure the concealment
" set conceallevel=1
" let g:tex_conceal = 'abdmg'

" Support default xelatex compile
let g:vimtex_compiler_latexmk_engines={
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \ }

" \ll compile
" \lv open PDF file

" EOF

