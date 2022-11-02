" Copyright (C) 2022. All rights reserved.
" File name   : vim-commentary.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : vim-commentary configuration file


autocmd Filetype lua setlocal commentstring=--\ %s
autocmd Filetype c,cpp,java setlocal commentstring=//\ %s
autocmd Filetype python,shell,markdown setlocal commentstring=#\ %s

" gcc: comment a count
" gcap: comment a paragraph

" EOF

