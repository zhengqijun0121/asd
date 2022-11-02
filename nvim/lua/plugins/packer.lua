-- Copyright (C) 2022. All rights reserved.
-- File name   : packer.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : packer configuration file


local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>pc', ':PackerClean<CR>',                { noremap = true, silent = false })
keymap('n', '<Leader>pi', ':PackerInstall<CR>',              { noremap = true, silent = false })
keymap('n', '<Leader>ps', ':PackerSync<CR>',                 { noremap = true, silent = false })
keymap('n', '<Leader>pu', ':PackerUpdate<CR>',               { noremap = true, silent = false })
keymap('n', '<Leader>pp', ':PackerProfile<CR>',              { noremap = true, silent = false })
keymap('n', '<Leader>pt', ':PackerCompile profile=true<CR>', { noremap = true, silent = false })

-- EOF

