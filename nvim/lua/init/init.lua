-- Copyright (C) 2022. All rights reserved.
-- File name   : init.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : neovim init configuration


local g   = vim.g
local o   = vim.o
local wo  = vim.wo
local bo  = vim.bo
local opt = vim.opt

g.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.splitright = true                 -- Split to the right in vsplit
o.splitbelow = true                 -- Split to the bottom in split
o.whichwrap = 'h,l,<,>'
o.backspace = 'indent,eol,start'    -- How backspace works at start of line
o.mouse = 'a'                       -- Enable mouse for any mode
o.guicursor = 'a:block'             -- Guicursor
o.backup = false
o.writebackup = false
o.background = 'dark'
o.termguicolors = true
opt.termguicolors = true
o.tabstop = 4
bo.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.smartindent = true
o.expandtab = true
bo.expandtab = true
o.autoindent = true
bo.autoindent = true
wo.number = true                    -- Show line number
wo.relativenumber = true            -- Show relative line number
wo.cursorline = true                -- Highlight current line number
wo.colorcolumn = '120'
o.ruler = true
o.wrap = false                      -- Display long text in one line
wo.wrap = false
o.laststatus = 2
o.scrolloff = 3
o.sidescrolloff = 3
o.foldenable = false                -- Do not fold on default
wo.signcolumn = 'yes'               -- Show sign column (e.g. lsp Error sign)
o.cmdheight = 1
o.list = true
o.listchars = 'tab:  ›,trail:•,extends:#,nbsp:.'    -- Highlight problematic whitespace
g.completeopt = 'menu,menuone,noselect'             -- Better completion
o.autoread = true
bo.autoread = true
o.wildmenu = true
o.showmode = false

-- g.mapleader = ','                -- Leader key

-- last-position-jump too slow !!!
-- use ethanholz/nvim-lastplace instead of it
-- vim.cmd [[
--     autocmd BufRead * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
-- ]]

-- EOF

