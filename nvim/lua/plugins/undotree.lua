-- Copyright (C) 2022. All rights reserved.
-- File name   : undotree.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-10-27
-- Description : undotree configuration file


local keymap = vim.keymap.set

keymap('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

require('undotree').setup {
    float_diff = true,  -- using float window previews diff, set this `true` will disable layout option
    layout = "left_bottom", -- "left_bottom", "left_left_bottom"
    ignore_filetype = { 'Undotree', 'UndotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
    window = {
        winblend = 30,
    },
    keymaps = {
        ['j'] = "move_next",
        ['k'] = "move_prev",
        ['J'] = "move_change_next",
        ['K'] = "move_change_prev",
        ['<cr>'] = "action_enter",
        ['p'] = "enter_diffbuf",
        ['q'] = "quit",
    },
}

-- EOF

