" Copyright (C) 2019. All rights reserved.
" File name   : keymap.vim
" Version     : v1.0
" Author      : codeMonkey
" Date        : 2019-08-26
" Description : vim key-mapping list


" From insert to normal mode
inoremap jj <ESC>
cnoremap jj <C-c>

" Enable <Left><Down><Up><Right>
" nnoremap <Left>  <Nop>
" nnoremap <Down>  <Nop>
" nnoremap <Up>    <Nop>
" nnoremap <Right> <Nop>

" Move in insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap b   <C-Left>
inoremap f   <C-Right>

" Page turning
nnoremap k <PageUp>
nnoremap j <PageDown>
inoremap k <PageUp>
inoremap j <PageDown>
vnoremap k <PageUp>
vnoremap j <PageDown>

" Delete
inoremap [3;5~ <C-Right>

" Windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Split windows
nnoremap <Leader>- :vsplit<CR>
nnoremap <Leader>_ :split<CR>

" Resize windows
nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize +4<CR>
nnoremap <C-Right> :vertical resize -4<CR>

" Buffer
" Close the current buffer
nnoremap <Leader>bd :bd<CR>

" Close all the buffers
nnoremap <Leader>ba :bufdo bd<CR>

" Switch buffer
nnoremap <Leader>bl :bnext<CR>
nnoremap <Leader>bh :bprevious<CR>
nnoremap <Leader>b1 :b 1<CR>
nnoremap <Leader>b2 :b 2<CR>
nnoremap <Leader>b3 :b 3<CR>
nnoremap <Leader>b4 :b 4<CR>
nnoremap <Leader>b5 :b 5<CR>
nnoremap <Leader>b6 :b 6<CR>
nnoremap <Leader>b7 :b 7<CR>
nnoremap <Leader>b8 :b 8<CR>
nnoremap <Leader>b9 :b 9<CR>

" Useful mappings for managing tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tm :tabmove<CR>
nnoremap <Leader>tj :tabnext<CR>

" Tab Management
" Create a new tab with tu
nnoremap tu :tabedit<CR>

" Move around tabs with tn and ti
nnoremap th :-tabnext<CR>
nnoremap tl :+tabnext<CR>

" Move the tabs with tmn and tmi
nnoremap tmn :-tabmove<CR>
nnoremap tmi :+tabmove<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <Leader>te :tabedit <C-r>=expand("%:p:h")<CR>/<CR>

" Terminal command
nnoremap <Leader>tt :terminal<CR>

" Switch CWD to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" command SW sudo saves the file
" (useful for handling the permission-denied error)
" command SW w !sudo tee % > /dev/null
command SW w !sudo tee % > /dev/null

" Delete trailing spaces
nnoremap <Leader>dss :%s/^ \+//g<CR>
nnoremap <Leader>des :%s/\s\+$//g<CR>

" Delete all characters from the cursor to end-of-line
inoremap <C-d> <C-\><C-o>D

" Close highlighting
nnoremap <Leader><CR> :nohlsearch<CR>

set pastetoggle=<F11>

" Save & Quit
nnoremap ; :
nnoremap W :w<CR>
nnoremap Q :q<CR>
nnoremap Z :q!<CR>

" Open the vimrc file anytime
nnoremap <Leader>ev :e ~/.vimrc<CR>

" Refuesh current file
nnoremap <Leader>er :e!<CR>

" Open in binary mode
nnoremap <Leader>eb :%!xxd -g 1<CR>

" Source the vimrc file
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Duplicate words
nnoremap <Leader>fd /\(\<\w\+\>\)\_s*\1

" Copy to system clipboard
" sudo apt-get install xclip
vnoremap Y :w !xclip -i -sel c<CR>
nnoremap Y y$

" Select and Highlinght insert text
nnoremap gv `[v`]

" select block
nnoremap gV V`}

" Select the pasted block
nnoremap <Expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Spelling Check
nnoremap <Leader>sc :set spell!<CR>

" Whitespace or Tab
nnoremap <Leader>et :set expandtab!<CR>

" Quickly add empty lines {
    nnoremap [<Space> :<C-u>put! =repeat(nr2char(10), v:count1)<CR>'[
    nnoremap ]<Space> :<C-u>put =repeat(nr2char(10), v:count1)<CR>
" } Quickly add empty lines

" Quickly move lines {
    nnoremap <Leader>[ :m .-2<CR>==
    nnoremap <Leader>] :m .+1<CR>==
    inoremap <Leader>[ <Esc>:m .-2<CR>==gi
    inoremap <Leader>] <Esc>:m .+1<CR>==gi
    vnoremap <Leader>[ :m '<-2<CR>==gv
    vnoremap <Leader>] :m '>+1<CR>==gv
" }

" Quickly edit your macros {
    nnoremap <Leader>em  :<C-u><C-r><C-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><C-f><Left>
" } Quickly edit your macros

" Avoid to adjust indentation {
    xnoremap <  <gv
    xnoremap >  >gv
    vnoremap <Tab>   >
    vnoremap <S-Tab> <
" } Avoid to adjust indentation

" vimdiff {
" ]c  jump the next different point
" [c  jump the prev different point
nnoremap <Leader>1 :diffget 1<CR> :diffupdate<CR>
nnoremap <Leader>2 :diffget 2<CR> :diffupdate<CR>
nnoremap <Leader>3 :diffget 3<CR> :diffupdate<CR>
nnoremap <Leader>4 :diffget 4<CR> :diffupdate<CR>
" } vimdiff

" EOF

