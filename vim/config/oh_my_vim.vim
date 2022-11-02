" Copyright (C) 2019. All rights reserved.
" File name   : oh_my_vim.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : oh_my_vim
"                ___  _           __  __             _   ___     _____ __  __
"               / _ \| |__       |  \/  |_   _      | \ | \ \   / /_ _|  \/  |
"              | | | | '_ \ _____| |\/| | | | |_____|  \| |\ \ / / | || |\/| |
"              | |_| | | | |_____| |  | | |_| |_____| |\  | \ V /  | || |  | |
"               \___/|_| |_|     |_|  |_|\__, |     |_| \_|  \_/  |___|_|  |_|
"                                        |___/
"
"                          ███████████████████████████
"                          ███████▀▀▀░░░░░░░▀▀▀███████
"                          ████▀░░░░░░░░░░░░░░░░░▀████
"                          ███│░░░░░░░░░░░░░░░░░░░│███
"                          ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                          ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                          ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                          ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                          ██▌░│██████▌░░░▐██████│░▐██
"                          ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                          ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                          ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                          ████▄─┘██▌░░░░░░░▐██└─▄████
"                          █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                          ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                          █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                          ███████▄░░░░░░░░░░░▄███████
"                          ██████████▄▄▄▄▄▄▄██████████
"                          ███████████████████████████


" for file in split(glob(fnamemodify(expand('<sfile>').'/*.vim'), '\n')
"     exec 'source' file
" endfor

let s:omv_config_path = fnamemodify(expand('<sfile>'), ':h')
exec 'source' s:omv_config_path.'/init/init.vim'
exec 'source' s:omv_config_path.'/init/filetype.vim'
exec 'source' s:omv_config_path.'/init/theme.vim'
exec 'source' s:omv_config_path.'/init/terminal.vim'
exec 'source' s:omv_config_path.'/init/plugin.vim'
exec 'source' s:omv_config_path.'/init/keymap.vim'

" EOF

