" Copyright (C) 2022. All rights reserved.
" File name   : defx.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : defx configuration file


" Git
let g:defx_git#column_length = 1
let g:defx_git#show_ignored = 0
let g:defx_git#raw_mode = 0
let g:defx_git#indicators = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Ignored'   : '☒',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '?'
    \ }


" Icons
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

nnoremap <silent> <C-e> :Defx -split=vertical -winwidth=35 -direction=topleft
    \ -columns=git:indent:icons:filename:type -toggle -search=`expand('%:p')` `getcwd()`<CR>

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction


autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>    <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> l       <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> c       defx#do_action('copy')
    nnoremap <silent><buffer><expr> m       defx#do_action('move')
    nnoremap <silent><buffer><expr> p       defx#do_action('paste')
    nnoremap <silent><buffer><expr> o       defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> O       defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> p       defx#do_action('preview')
    nnoremap <silent><buffer><expr> t       defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> <C-n>   defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N       defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M       defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C       defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d       defx#do_action('remove')
    nnoremap <silent><buffer><expr> r       defx#do_action('rename')
    nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x       defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yp      defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;       defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h       defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
    nnoremap <silent><buffer><expr> <C-e>   defx#do_action('quit')
    nnoremap <silent><buffer><expr> q       defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-r>   defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>   defx#do_action('print')
    nnoremap <silent><buffer><expr> cd      defx#do_action('change_vim_cwd')
endfunction

" kristijanhusak/defx-git {
" nnoremap <buffer><silent> [c <Plug>(defx-git-prev)
" nnoremap <buffer><silent> ]c <Plug>(defx-git-next)
" nnoremap <buffer><silent> ]a <Plug>(defx-git-stage)
" nnoremap <buffer><silent> ]r <Plug>(defx-git-reset)
" nnoremap <buffer><silent> ]d <Plug>(defx-git-discard)
" } kristijanhusak/defx-git

" EOF

