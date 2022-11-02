" Copyright (C) 2019. All rights reserved.
" File name   : plugin.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : vim plugin list


"---------------------------------------+-------------------------------------------------------------------
" Command                               | Description                                                      ~
"---------------------------------------+-------------------------------------------------------------------
"  `PlugInstall [name ...] [#threads]`  | Install plugins
"  `PlugUpdate [name ...] [#threads]`   | Install or update plugins
"  `PlugClean[!]`                       | Remove unused directories (bang version will clean without prompt)
"  `PlugUpgrade`                        | Upgrade vim-plug itself
"  `PlugStatus`                         | Check the status of plugins
"  `PlugDiff`                           | Examine changes from the previous update and the pending changes
"  `PlugSnapshot[!] [output path]`      | Generate script for restoring the current snapshot of the plugins
"---------------------------------------+-------------------------------------------------------------------

"---------------------------------------+-------------------------------------------------------------------
" Option                                | Description                                                      ~
"---------------------------------------+-------------------------------------------------------------------
"  `branch` / `tag` / `commit`          | Branch/tag/commit of the repository to use
"  `rtp`                                | Subdirectory that contains Vim plugin
"  `dir`                                | Custom directory for the plugin
"  `as`                                 | Use different name for the plugin
"  `do`                                 | Post-update hook (string or funcref)
"  `on`                                 | On-demand loading: Commands or <Plug>-mappings
"  `for`                                | On-demand loading: File types
"  `frozen`                             | Do not update unless explicitly specified
"---------------------------------------+-------------------------------------------------------------------

"----------------------+-----------------------------------+----------------------------------------------------------------------------------
" Flag                 | Default                           | Description                                                                     ~
" ---------------------+-----------------------------------+----------------------------------------------------------------------------------
"  `g:plug_threads`    | 16                                | Default number of threads to use
"  `g:plug_timeout`    | 60                                | Time limit of each task in seconds (*Ruby & Python*)
"  `g:plug_retries`    | 2                                 | Number of retries in case of timeout (*Ruby & Python*)
"  `g:plug_shallow`    | 1                                 | Use shallow clone
"  `g:plug_window`     | `vertical topleft new`            | Command to open plug window
"  `g:plug_pwindow`    | `above 12new`                     | Command to open preview window in `PlugDiff`
"  `g:plug_url_format` | `https://git::@github.com/%s.git` | `printf` format to build repo URL (Only applies to the subsequent `Plug` commands)
"----------------------+-----------------------------------+-----------------------------------------------------------------------------------


" Load the configuration of plugins
let s:omv_plugin_path = fnamemodify(expand('<sfile>'), ':h').'/'

function! LoadPlugin(file)
    exec 'source' s:omv_plugin_path.a:file
endfunction


if g:myvimrc_load_plugin == 1
    if g:myvimrc_load_plugin_type == 'github'
        " Download vim-plug
        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

        let g:plug_url_format = 'https://git::@github.com/%s.git'

        " Specify a directory for plugins
        " - For Neovim: ~/.local/share/nvim/plugged
        " - Avoid using standard Vim directory names like 'plugin'
        call plug#begin('~/.vim/plugged')
        call LoadPlugin('../plugins/vim-plug.vim')

        " Make sure you use single quotes

        " Starting of plugin

        " AI Code Completion
        Plug 'codota/tabnine-vim', { 'on': [] }
        call LoadPlugin('../plugins/tabnine-vim.vim')

        Plug 'rdnetto/YCM-Generator', { 'branch': 'stable', 'for': 'cpp' }

        " Snippets
        Plug 'SirVer/ultisnips'
        call LoadPlugin('../plugins/ultisnips.vim')

        Plug 'honza/vim-snippets'

        " Markdown
        Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }

        Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
        call LoadPlugin('../plugins/markdown-preview.vim')

        Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }

        Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
        call LoadPlugin('../plugins/vim-table-mode.vim')

        " Wiki
        Plug 'vimwiki/vimwiki', { 'for': 'markdown' }
        call LoadPlugin('../plugins/vimwiki.vim')

        " Org-Mode
        Plug 'jceb/vim-orgmode', { 'for': 'org' }

        " LaTex
        Plug 'lervag/vimtex', { 'for': 'tex' }
        call LoadPlugin('../plugins/vimtex.vim')

        " Go development plugin
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

        " Emmet for css/html
        Plug 'mattn/emmet-vim', { 'for': ['css', 'html'] }

        " Javascript indentation and syntax support
        Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
        call LoadPlugin('../plugins/vim-javascript.vim')

        " Auto-pairs
        Plug 'jiangmiao/auto-pairs'

        " Surroundings
        Plug 'tpope/vim-surround'

        " Comment
        Plug 'tpope/vim-commentary'

        " Motion
        Plug 'easymotion/vim-easymotion'

        " Multiple cursors
        Plug 'terryma/vim-multiple-cursors'

        " Floaterm
        Plug 'voldikss/vim-floaterm'
        call LoadPlugin('../plugins/vim-floaterm.vim')

        " File explorer
        " pip3 install --user pynvim
        Plug 'Shougo/defx.nvim'
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'roxma/nvim-yarp'
        Plug 'kristijanhusak/defx-icons'
        Plug 'kristijanhusak/defx-git'
        call LoadPlugin('../plugins/defx.vim')

        " Code outline
        Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
        call LoadPlugin('../plugins/tagbar.vim')

        " Tmux seamless navigation
        Plug 'christoomey/vim-tmux-navigator'
        call LoadPlugin('../plugins/vim-tmux-navigator.vim')

        " Fuzzy finder
        Plug 'junegunn/fzf', { 'do': './install --key-bindings --completion --no-update-rc' }
        Plug 'junegunn/fzf.vim'
        call LoadPlugin('../plugins/fzf.vim')

        " Find And Replace
        Plug 'brooth/far.vim'

        " The missing motion
        " Plug 'justinmk/vim-sneak'

        " Repeating
        Plug 'tpope/vim-repeat'

        " Filtering and alignment
        Plug 'godlygeek/tabular'

        " Indent
        Plug 'Yggdroot/indentLine', { 'for': 'python' }

        " Highlighting
        Plug 'lfv89/vim-interestingwords'

        " TaskList
        Plug 'vim-scripts/TaskList.vim'
        call LoadPlugin('../plugins/TaskList.vim')

        " Undo
        Plug 'mbbill/undotree'
        call LoadPlugin('../plugins/undotree.vim')

        " MRU
        Plug 'vim-scripts/mru.vim'
        call LoadPlugin('../plugins/mru.vim')

        " Git blame
        Plug 'APZelos/blamer.nvim'
        call LoadPlugin('../plugins/blamer.vim')

        " Git diff
        Plug 'airblade/vim-gitgutter', { 'on': [] }
        call LoadPlugin('../plugins/vim-gitgutter.vim')

        " Last place
        Plug 'farmergreg/vim-lastplace'

        " Hyperfocus
        Plug 'junegunn/limelight.vim'
        call LoadPlugin('../plugins/limelight.vim')

        " Zenmode
        Plug 'junegunn/goyo.vim'
        call LoadPlugin('../plugins/goyo.vim')

        " Startify
        Plug 'mhinz/vim-startify'
        call LoadPlugin('../plugins/vim-startify.vim')

        " Bufferline
        Plug 'ap/vim-buftabline'

        " Statusline
        Plug 'zhengqijun0121/vim-airline', { 'branch': 'custom' }
        call LoadPlugin('../plugins/vim-airline.vim')

        " Startuptime
        Plug 'dstein64/vim-startuptime'

        " The list of keys
        Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
        call LoadPlugin('../plugins/vim-which-key.vim')

        " Ending of plugin

        " Initialize plugin system
        call plug#end()
    elseif g:myvimrc_load_plugin_type == 'gitee'
        " Download vim-plug
        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://gitee.com/zhengqijun/vim-plug/raw/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

        let g:plug_url_format = 'https://git::@gitee.com/%s.git'

        " Specify a directory for plugins
        " - For Neovim: ~/.local/share/nvim/plugged
        " - Avoid using standard Vim directory names like 'plugin'
        call plug#begin('~/.vim/plugged')
        call LoadPlugin('../plugins/vim-plug.vim')

        " Make sure you use single quotes

        " Starting of plugin

        " AI Code Completion
        Plug 'zhengqijun/tabnine-vim', { 'on': [] }
        call LoadPlugin('../plugins/tabnine-vim.vim')

        Plug 'zhengqijun/YCM-Generator', { 'branch': 'stable', 'for': 'cpp' }

        " Snippets
        Plug 'zhengqijun/ultisnips'
        call LoadPlugin('../plugins/ultisnips.vim')

        Plug 'zhengqijun/vim-snippets'

        " Markdown
        Plug 'zhengqijun/mathjax-support-for-mkdp', { 'for': 'markdown' }

        Plug 'zhengqijun/markdown-preview.vim', { 'for': 'markdown' }
        call LoadPlugin('../plugins/markdown-preview.vim')

        Plug 'zhengqijun/vim-markdown-toc', { 'for': 'markdown' }

        Plug 'zhengqijun/vim-table-mode', { 'for': 'markdown' }
        call LoadPlugin('../plugins/vim-table-mode.vim')

        " Wiki
        Plug 'zhengqijun/vimwiki', { 'for': 'markdown' }
        call LoadPlugin('../plugins/vimwiki.vim')

        " Org-Mode
        Plug 'zhengqijun/vim-orgmode', { 'for': 'org' }

        " LaTex
        Plug 'zhengqijun/vimtex', { 'for': 'tex' }
        call LoadPlugin('../plugins/vimtex.vim')

        " Go development plugin
        Plug 'zhengqijun/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

        " Emmet for css/html
        Plug 'zhengqijun/emmet-vim', { 'for': ['css', 'html'] }

        " Javascript indentation and syntax support
        Plug 'zhengqijun/vim-javascript', { 'for': 'javascript' }
        call LoadPlugin('../plugins/vim-javascript.vim')

        " Auto-pairs
        Plug 'zhengqijun/auto-pairs'

        " Surroundings
        Plug 'zhengqijun/vim-surround'

        " Comment
        Plug 'zhengqijun/vim-commentary'

        " Motion
        Plug 'zhengqijun/vim-easymotion'

        " Multiple cursors
        Plug 'zhengqijun/vim-multiple-cursors'

        " Floaterm
        Plug 'zhengqijun/vim-floaterm'
        call LoadPlugin('../plugins/vim-floaterm.vim')

        " File explorer
        Plug 'zhengqijun/defx.nvim'
        Plug 'zhengqijun/vim-hug-neovim-rpc'
        Plug 'zhengqijun/nvim-yarp'
        Plug 'zhengqijun/defx-icons'
        Plug 'zhengqijun/defx-git'
        call LoadPlugin('../plugins/defx.vim')

        " Code outline
        Plug 'zhengqijun/tagbar', { 'on':  'TagbarToggle' }
        call LoadPlugin('../plugins/tagbar.vim')

        " Tmux seamless navigation
        Plug 'zhengqijun/vim-tmux-navigator'
        call LoadPlugin('../plugins/vim-tmux-navigator.vim')

        " Fuzzy finder
        Plug 'zhengqijun/fzf', { 'do': './install --key-bindings --completion --no-update-rc' }
        Plug 'zhengqijun/fzf.vim'
        call LoadPlugin('../plugins/fzf.vim')

        " Find And Replace
        Plug 'zhengqijun/far.vim'

        " The missing motion
        " Plug 'zhengqijun/vim-sneak'

        " Repeating
        Plug 'zhengqijun/vim-repeat'

        " Filtering and alignment
        Plug 'zhengqijun/tabular'

        " Indent
        Plug 'zhengqijun/indentLine', { 'for': 'python' }

        " Highlighting
        Plug 'zhengqijun/vim-interestingwords'

        " TaskList
        Plug 'zhengqijun/TaskList.vim'
        call LoadPlugin('../plugins/TaskList.vim')

        " Undo
        Plug 'zhengqijun/undotree'
        call LoadPlugin('../plugins/undotree.vim')

        " MRU
        Plug 'zhengqijun/mru.vim'
        call LoadPlugin('../plugins/mru.vim')

        " Git blame
        Plug 'zhengqijun/blamer.nvim'
        call LoadPlugin('../plugins/blamer.vim')

        " Git diff
        Plug 'zhengqijun/vim-gitgutter', { 'on': [] }
        call LoadPlugin('../plugins/vim-gitgutter.vim')

        " Last place
        Plug 'zhengqijun/vim-lastplace'

        " Hyperfocus
        Plug 'zhengqijun/limelight.vim'
        call LoadPlugin('../plugins/limelight.vim')

        " Zenmode
        Plug 'zhengqijun/goyo.vim'
        call LoadPlugin('../plugins/goyo.vim')

        " Startify
        Plug 'zhengqijun/vim-startify'
        call LoadPlugin('../plugins/vim-startify.vim')

        " Bufferline
        Plug 'zhengqijun/vim-buftabline'

        " Statusline
        Plug 'zhengqijun/vim-airline', { 'branch': 'custom' }
        call LoadPlugin('../plugins/vim-airline.vim')

        " Startuptime
        Plug 'zhengqijun/vim-startuptime'

        " The list of keys
        Plug 'zhengqijun/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
        call LoadPlugin('../plugins/vim-which-key.vim')

        " Ending of plugin

        " Initialize plugin system
        call plug#end()
    endif
endif

" EOF

