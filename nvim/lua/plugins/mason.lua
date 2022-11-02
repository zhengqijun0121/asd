-- Copyright (C) 2022. All rights reserved.
-- File name   : mason.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-10-27
-- Description : mason configuration file


local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>lm', ':Mason<CR>', { noremap = true, silent = true })

require('mason').setup()

-- EOF

