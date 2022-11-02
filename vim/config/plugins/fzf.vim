" Copyright (C) 2022. All rights reserved.
" File name   : fzf.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : fzf configuration file


"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%', '?'),
    \                 <bang>0)

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fa :Ag<CR>
nnoremap <Leader>fm :Mark<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fs :Snippets<CR>
nnoremap <Leader>fM :Maps<CR>
nnoremap <Leader>fF :Filetypes<CR>

" EOF

