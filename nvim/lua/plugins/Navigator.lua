-- Copyright (C) 2022. All rights reserved.
-- File name   : Navigator.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : Navigator configuration file


-- Configuration
require('Navigator').setup()

-- Keybindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
keymap('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
keymap('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
keymap('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
keymap('n', "<C-p>", "<CMD>lua require('Navigator').previous()<CR>", opts)
-- EOF

