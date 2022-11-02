" Copyright (C) 2022. All rights reserved.
" File name   : vim-javascript.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : vim-javascript configuration file


let g:javascript_plugin_jsdoc = 1                   " Enables syntax highlighting for JSDocs.
let g:javascript_plugin_ngdoc = 1                   " Enables some additional syntax highlighting for NGDocs.
let g:javascript_plugin_flow = 1                    " Enables syntax highlighting for Flow.

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Concealing Characters
let g:javascript_conceal_function                   = "ƒ"
let g:javascript_conceal_null                       = "ø"
let g:javascript_conceal_this                       = "@"
let g:javascript_conceal_return                     = "⇚"
let g:javascript_conceal_undefined                  = "¿"
let g:javascript_conceal_NaN                        = "ℕ"
let g:javascript_conceal_prototype                  = "¶"
let g:javascript_conceal_static                     = "•"
let g:javascript_conceal_super                      = "Ω"
let g:javascript_conceal_arrow_function             = "⇒"
let g:javascript_conceal_noarg_arrow_function       = "�"
let g:javascript_conceal_underscore_arrow_function  = "�"

set conceallevel=1
nnoremap <Leader>jsc :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" EOF

