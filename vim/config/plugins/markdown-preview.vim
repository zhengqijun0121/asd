" Copyright (C) 2022. All rights reserved.
" File name   : markdown-preview.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : markdown-preview configuration file


" let g:mkdp_path_to_chrome = "/opt/google/chrome/chrome"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0

nnoremap <Leader>mps :MarkdownPreview<CR>
nnoremap <Leader>mpe :StopMarkdownPreview<CR>

" EOF

