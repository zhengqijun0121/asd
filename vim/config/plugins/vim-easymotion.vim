" Copyright (C) 2022. All rights reserved.
" File name   : vim-easymotion.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : vim-easymotion configuration file


" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" <Plug> recursive
nmap <Leader><Leader>s  <Plug>(easymotion-sn)
omap <Leader><Leader>t  <Plug>(easymotion-tn)
nmap <Leader><Leader>n  <Plug>(easymotion-next)
nmap <Leader><Leader>p  <Plug>(easymotion-prev)
nmap <Leader><Leader>S  <Plug>(easymotion-s2)
omap <Leader><Leader>T  <Plug>(easymotion-t2)

nmap <Leader><Leader>h  <Plug>(easymotion-linebackward)
nmap <Leader><Leader>j  <Plug>(easymotion-j)
nmap <Leader><Leader>k  <Plug>(easymotion-k)
nmap <Leader><Leader>l  <Plug>(easymotion-lineforward)
nmap <Leader><Leader>.  <Plug>(easymotion-repeat)

" EOF

