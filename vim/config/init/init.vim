" Copyright (C) 2019. All rights reserved.
" File name   : init.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : vim init configuration


set nocompatible                        " Compatible with Vi

" Encoding
set encoding=utf-8                      " Encoding used internally
set helplang=cn                         " Preferred help languages
set langmenu=zh_CN.UTF-8                " Menu language
set fileformats=unix,dos,mac            " Use Unix as the standard file type

" Display
set wildmenu                            " Use menu for command line completion
set showmode                            " Show Vim mode in status line. (default)
set showcmd                             " Show command in status line.
set number                              " Display line number
set relativenumber                      " Display relative number
set ruler                               " Display cursor position (default)
set cursorline                          " Display cursor line
" set cursorcolumn                      " Display cursor column
set nowrap                              " Automatically scroll the text
set history=1000                        " Keep commands and search patterns in the history.
set sidescroll=10                       " Minimum number of columns to scroll horizontal
set laststatus=2                        " Last window has status lines
set scrolloff=3                         " Minimum nr. of lines above and below cursor

set whichwrap=h,l,<,>                   " Allow to move the cursors to the previous or next line in normal mode
set backspace=indent,eol,start          " How backspace works at start of line
set mouse=a                             " Enable mouse usage (all modes)


" set autoindent                        " Smart auto indenting for C programs
set cindent                             " Indenting for C programs
" set autowrite                         " Automatically write file if changed
set autoread                            " Automatically read file while changed outside of Vim
set nolinebreak                         " No wrap long lines at a blank
set noshowmatch                         " No briefly jump to matching bracket if insert one
" set matchtime=1                       " Show matching time
set iskeyword+=_,%,#                    " Characters included in keywords(_ $ @ % # -)
set hidden                              " A buffer becomes hidden when it is abandoned
set clipboard=unnamed                   " Use the clipboard as the unnamed register
set viminfo='1000,<800                  " Set viminfo
set nobackup                            " No backup file
" let mapleader=","                     " Leader key
set linespace=0                         " Number of pixel lines inserted between characters
set report=0                            " View changes by commands
set colorcolumn=120                     " Highlight screen columns(default:81)

" Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                           " Use spaces when Tab is inserted
set smarttab                            " Smart Tab

set list                                " To make tab and EOL visible
set listchars=tab:›\ ,trail:•           " Highlight problematic whitespace
set listchars+=extends:#,nbsp:.         " Highlight problematic whitespace

" Search Function
set hlsearch                            " Highlight matching
set incsearch                           " Incremental search
set ignorecase                          " Do case insensitive matching
set smartcase                           " Do smart case matching
set wrapscan                            " Searches wrap around the end of the file

" Window
set splitright                          " Puts new vsplit windows to the right of the current
set splitbelow                          " Puts new split windows to the bottom of the current

" Fold
set foldenable                          " Set to display all folds open
set foldmethod=manual                   " Manual fold


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
    syntax enable
    syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
" https://github.com/farmergreg/vim-lastplace
" if has("autocmd")
"     au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
    filetype plugin indent on
endif

" Modify paste problem {
    " function! WrapForTmux(s)
    "   if !exists('$TMUX')
    "     return a:s
    "   endif
    "
    "   let tmux_start = "\<Esc>Ptmux;"
    "   let tmux_end = "\<Esc>\\"
    "
    "   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
    " endfunction
    "
    " let &t_SI .= WrapForTmux("\<Esc>[?2004h")
    " let &t_EI .= WrapForTmux("\<Esc>[?2004l")
    "
    " function! XTermPasteBegin()
    "   set pastetoggle=<Esc>[201~
    "   set paste
    "   return ""
    " endfunction
    "
    " inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" } Modify paste problem


" let g:myvimrc_load_plugin = 0
if !exists('g:myvimrc_load_plugin')
    let g:myvimrc_load_plugin = 1
    let g:myvimrc_load_plugin_type = 'gitee'
    " let g:myvimrc_load_plugin_type = 'github'
else
    let g:myvimrc_load_plugin = g:myvimrc_load_plugin
endif

" EOF

