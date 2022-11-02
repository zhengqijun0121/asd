" Copyright (C) 2022. All rights reserved.
" File name   : tabnine-vim.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2022-01-20
" Description : tabnine-vim configuration file


" Project YouCompleteMe configuration file (YcmCompleter)
augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('tabnine-vim') | autocmd! load_ycm
augroup END

" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.oh-my-dotfiles/vim/files/ycm/.ycm_extra_conf.py'

" Python3
" let g:ycm_python_binary_path = '/usr/bin/python3'

set completeopt=longest,menu                            " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif " 离开插入模式后自动关闭预览窗口

" Youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion   = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

let g:ycm_confirm_extra_conf = 0                        " 关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion = 2           " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc = 0                            " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax = 1              " 语法关键字补全

" Close diagnostics
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_show_diagnostics_ui = 0
" set completeopt=menu,menuone

" Complete
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1       " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:clang_user_options='|| exit 0'

" 回车即选中当前项
" Note. " != '
inoremap <Expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" 上下左右键的行为 会显示其他信息
inoremap <Expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <Expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <Expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <Expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

nnoremap <Leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>gt :YcmCompleter GetType<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>

" nnoremap <Leader>lo :lopen<CR>                        " open locationlist
" nnoremap <Leader>lc :lclose<CR>                       " close locationlist
" nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" YouCompleteMe快捷键使用
" 1. \jd    : 跳转到函数声明处或者定义处
" 2. Ctrl+o : 光标跳转到上一位置
" 3. Ctrl+i : 光标跳转到下一位置

" EOF

