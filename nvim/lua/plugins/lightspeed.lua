-- Copyright (C) 2022. All rights reserved.
-- File name   : lightspeed.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : lightspeed configuration file


local keymap = vim.api.nvim_set_keymap

-- `<Plug>Lightspeed_s`  2-character  forward   /-like (0,  exclusive op)
-- `<Plug>Lightspeed_S`  2-character  backward  ?-like (0,  exclusive op)
keymap('n', '<Leader>m', '<Plug>Lightspeed_s', { noremap = false, silent = true })
keymap('n', '<Leader>M', '<Plug>Lightspeed_S', { noremap = false, silent = true })

-- EOF

