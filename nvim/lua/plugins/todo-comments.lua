-- Copyright (C) 2022. All rights reserved.
-- File name   : todo-comments.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : todo-comments configuration file


require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>lf', ':TodoQuickFix<CR>',  { noremap = true, silent = false })
keymap('n', '<Leader>ll', ':TodoLocList<CR>',   { noremap = true, silent = false })
keymap('n', '<Leader>la', ':TodoTrouble<CR>',   { noremap = true, silent = false })
keymap('n', '<Leader>lt', ':TodoTelescope<CR>', { noremap = true, silent = false })

-- EOF

