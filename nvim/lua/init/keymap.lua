-- Copyright (C) 2022. All rights reserved.
-- File name   : keymap.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : keymap


local keymap = vim.api.nvim_set_keymap

-- From insert to normal mode
keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })
keymap('c', 'jj', '<C-c>', { noremap = true, silent = true })

-- Enable <Left><Down><Up><Right>
-- keymap('n', '<Left>',  '<Nop>', { noremap = true, silent = true })
-- keymap('n', '<Down>',  '<Nop>', { noremap = true, silent = true })
-- keymap('n', '<Up>',    '<Nop>', { noremap = true, silent = true })
-- keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })

-- vim.fn.has('macunix') == 1
-- Iterm2: Preferences -> Profiles -> Keys -> +ESC !!!

-- Move in insert mode
keymap('i', '<M-a>', '<Home>',    { noremap = true, silent = true })
keymap('i', '<M-e>', '<End>',     { noremap = true, silent = true })
keymap('i', '<M-b>', '<Left>',    { noremap = true, silent = true })
keymap('i', '<M-f>', '<Right>',   { noremap = true, silent = true })
keymap('i', '<M-h>', '<Left>',    { noremap = true, silent = true })
keymap('i', '<M-n>', '<Down>',    { noremap = true, silent = true })
keymap('i', '<M-p>', '<Up>',      { noremap = true, silent = true })
keymap('i', '<M-l>', '<Right>',   { noremap = true, silent = true })
keymap('i', '<M-B>', '<C-Left>',  { noremap = true, silent = true })
keymap('i', '<M-F>', '<C-Right>', { noremap = true, silent = true })

-- Page turning
keymap('n', '<M-k>', '<PageUp>',   { noremap = true, silent = true })
keymap('n', '<M-j>', '<PageDown>', { noremap = true, silent = true })
keymap('i', '<M-k>', '<PageUp>',   { noremap = true, silent = true })
keymap('i', '<M-j>', '<PageDown>', { noremap = true, silent = true })
keymap('v', '<M-k>', '<PageUp>',   { noremap = true, silent = true })
keymap('v', '<M-j>', '<PageDown>', { noremap = true, silent = true })

-- Delete
-- Note. Ctrl + H = Ctrl + <BS> = ^H
keymap('i', '<M-BS>',  '<C-w>',          { noremap = true, silent = true })
keymap('i', '<M-Del>', '<C-Right><C-w>', { noremap = true, silent = true })

-- Windows
keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Split windows
keymap('n', '<Leader>-', ':vsplit<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>_', ':split<CR>',  { noremap = true, silent = true })

-- Resize windows
keymap('n', '<C-Up>',    ':resize +2<CR>',          { noremap = true, silent = true })
keymap('n', '<C-Down>',  ':resize -2<CR>',          { noremap = true, silent = true })
keymap('n', '<C-Left>',  ':vertical resize +4<CR>', { noremap = true, silent = true })
keymap('n', '<C-Right>', ':vertical resize -4<CR>', { noremap = true, silent = true })

-- Buffer
-- Close the current buffer
keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- Close all the buffers
keymap('n', '<Leader>ba', ':bufdo bd<CR>', { noremap = true, silent = true })

-- Switch buffer
keymap('n', '<Leader>bl', ':bnext<CR>',     { noremap = true, silent = true })
keymap('n', '<Leader>bh', ':bprevious<CR>', { noremap = true, silent = true })

-- Useful mappings for managing tabs
keymap('n', '<Leader>tn', ':tabnew<CR>',   { noremap = true, silent = true })
keymap('n', '<Leader>to', ':tabonly<CR>',  { noremap = true, silent = true })
keymap('n', '<Leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>tm', ':tabmove<CR>',  { noremap = true, silent = true })
keymap('n', '<Leader>tj', ':tabnext<CR>',  { noremap = true, silent = true })

-- Terminal command
keymap('n', '<Leader>tt', ':terminal<CR>', { noremap = true, silent = true })

-- Tab Management
-- Create a new tab with tu
keymap('n', 'tu', ':tabedit<CR>', { noremap = true, silent = true })

-- Move around tabs with th and tl
keymap('n', '<Leader>th', ':-tabnext<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>tl', ':+tabnext<CR>', { noremap = true, silent = true })

-- Move the tabs with tmn and tmi
keymap('n', '<Leader>tmn', ':-tabmove<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>tmi', ':+tabmove<CR>', { noremap = true, silent = true })

-- Opens a new tab with the current buffer's path
-- Super useful when editing files in the same directory
keymap('n', '<Leader>te', ':tabedit <C-r>=expand("%:p:h")<CR>/<CR>', { noremap = true, silent = true })

-- Switch CWD to the directory of the open buffer
keymap('n', '<Leader>pwd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })

-- command SW sudo saves the file
-- (useful for handling the permission-denied error)
keymap('n', '<Leader>SW', ':w !sudo tee % > /dev/null',  { noremap = true, silent = true })

-- Delete trailing spaces
keymap('n', '<Leader>dss', ':%s/^ \\+//g<CR>',   { noremap = true, silent = true })
keymap('n', '<Leader>des', ':%s/\\s\\+$//g<CR>', { noremap = true, silent = true })

-- Delete all characters from the cursor to end-of-line
keymap('i', '<C-d>', '<C-\\><C-o>D', { noremap = true, silent = true })

-- Close highlighting
keymap('n', '<Leader><CR>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Save & Quit
keymap('n', ';', ':',       { noremap = true, silent = false })
keymap('n', 'Q', ':q<CR>',  { noremap = true, silent = true })
keymap('n', 'W', ':w<CR>',  { noremap = true, silent = true })
keymap('n', 'Z', ':q!<CR>', { noremap = true, silent = true })

-- Open the init.lua file anytime
keymap('n', '<Leader>ev', ':e ~/.config/nvim/init.lua<CR>', { noremap = true, silent = false })

-- Refuesh current file
keymap('n', '<Leader>er', ':e!<CR>', { noremap = true, silent = true })

-- Open in binary mode
keymap('n', '<Leader>eb', ':%!xxd -g 1<CR>', { noremap = true, silent = true })

-- Source the vimrc file
keymap('n', '<Leader>sv', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Duplicate words
keymap('n', '<Leader>fd', '/', { noremap = true, silent = true })
--nnoremap <Leader>fd /\(\<\w\+\>\)\_s*\1

-- Copy to system clipboard
-- sudo apt-get install xclip
keymap('v', 'Y', ':w !xclip -i -sel c<CR>', { noremap = true, silent = true })
keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- Select and Highlinght insert text
keymap('n', 'gv', '`[v`]', { noremap = true, silent = true })

-- select block
keymap('n', 'gV', 'V`}', { noremap = true, silent = true })

-- Select the pasted block
keymap('n', '<Expr>gp', '"`[". strpart(getregtype(), 0, 1) . "`]', { noremap = true, silent = true })

-- Spelling Check
keymap('n', '<Leader>sc', ':set spell!<CR>', { noremap = true, silent = true })

-- Whitespace or Tab
keymap('n', '<Leader>et', ':set expandtab!<CR>', { noremap = true, silent = true })

-- Quickly add empty lines {
    keymap('n', '[<Space>', ':<C-u>put! =repeat(nr2char(10), v:count1)<CR>\'[', { noremap = true, silent = true })
    keymap('n', ']<Space>', ':<C-u>put =repeat(nr2char(10), v:count1)<CR>',     { noremap = true, silent = true })
-- } Quickly add empty lines

-- Quickly move lines {
    keymap('n', '<Leader>[', ':m .-2<CR>==',        { noremap = true, silent = true })
    keymap('n', '<Leader>]', ':m .+1<CR>==',        { noremap = true, silent = true })
    keymap('v', '<Leader>[', ':m .-2<CR>==gv',      { noremap = true, silent = true })
    keymap('v', '<Leader>]', ':m .+1<CR>==gv',      { noremap = true, silent = true })
    keymap('i', '<Leader>[', '<ESC>:m .-2<CR>==gi', { noremap = true, silent = true })
    keymap('i', '<Leader>]', '<ESC>:m .+1<CR>==gi', { noremap = true, silent = true })
-- } Quickly move lines

-- Quickly edit your macros {
    keymap('n', '<Leader>em', ':<C-u><C-r><C-r>=\'let @\'. v:register .\' = \'. string(getreg(v:register))<CR><C-f><Left>', { noremap = true, silent = true })
-- } Quickly edit your macros

-- Avoid to adjust indentation {
    keymap('x', '<',       '<gv', { noremap = true, silent = true })
    keymap('x', '>',       '>gv', { noremap = true, silent = true })
    keymap('v', '<Tab>',   '<',   { noremap = true, silent = true })
    keymap('v', '<S-Tab>', '>',   { noremap = true, silent = true })
-- } Avoid to adjust indentation

-- vimdiff {
    -- ]c  jump the next different point
    -- [c  jump the prev different point
    keymap('n', '<Leader>1', ':diffget 1<CR> :diffupdate<CR>', { noremap = true, silent = true })
    keymap('n', '<Leader>2', ':diffget 2<CR> :diffupdate<CR>', { noremap = true, silent = true })
    keymap('n', '<Leader>3', ':diffget 3<CR> :diffupdate<CR>', { noremap = true, silent = true })
    keymap('n', '<Leader>4', ':diffget 4<CR> :diffupdate<CR>', { noremap = true, silent = true })
-- } vimdiff

-- EOF

