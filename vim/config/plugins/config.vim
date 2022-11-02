" Copyright (C) 2019. All rights reserved.
" File name   : config.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : vim configure plugin


if g:myvimrc_load_plugin == 1
    " scrooloose/nerdtree {
        autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

        let g:NERDTreeDirArrowExpandable  = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
    " }

    " Xuyuanp/nerdtree-git-plugin {
        let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
    " }

    " dense-analysis/ale {
        augroup load_ale
            autocmd!
            autocmd InsertEnter * call plug#load('ale') | autocmd! load_ale
        augroup END

        let g:ale_enabled = 0
        let g:ale_sign_column_always = 0
        let g:ale_sign_error = '✗'
        let g:ale_sign_warning = '⚡'
        let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
        let g:ale_echo_msg_error_str = 'E'
        let g:ale_echo_msg_warning_str = 'W'
        let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
        let g:ale_set_highlights = 0
        let g:ale_list_window_size = 5

        let g:ale_linters = {
            \   'c': ['clang'],
            \   'c++': ['clang'],
            \   'python': ['pylint'],
            \ }
    " }
endif

" EOF

