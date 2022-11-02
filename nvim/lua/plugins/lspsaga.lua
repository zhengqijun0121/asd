-- Copyright (C) 2022. All rights reserved.
-- File name   : packer.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : packer configuration file


require('lspsaga').init_lsp_saga()

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lsp provider to find the cursor word definition and reference
keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)

-- code action
keymap('n', '<Leader>ca', ':Lspsaga code_action<CR>',            opts)
keymap('v', '<Leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)

-- show hover doc
keymap('n', '<Leader>gk', ':Lspsaga hover_doc<CR>', opts)

-- scroll down hover doc or scroll in definition preview
keymap('n', '<C-f>', '<Cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>',  opts)
-- scroll up hover doc
keymap('n', '<C-b>', '<Cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

-- show signature help
keymap('n', 'gs', ':Lspsaga signature_help<CR>', opts)

-- rename
keymap('n', '<Leader>rn', ':Lspsaga rename<CR>', opts)

-- preview definition
keymap('n', '<Leader>gd', ':Lspsaga preview_definition<CR>', opts)

-- show
keymap('n', '<Leader>cd', ':Lspsaga show_line_diagnostics<CR>', opts)

-- only show diagnostic if cursor is over the area
keymap('n', '<Leader>cc', '<Cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', opts)

-- jump diagnostic
keymap('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)

-- float terminal also you can pass the cli command in open_float_terminal function
keymap('n', '<A-d>', ':Lspsaga open_floaterm<CR>',             opts)
keymap('t', '<A-d>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', opts)

-- EOF

