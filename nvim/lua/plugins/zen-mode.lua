-- Copyright (C) 2022. All rights reserved.
-- File name   : zen-mode.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : zen-mode configuration file


require("zen-mode").setup {
    window = {
        width = .85 -- width will be 85% of the editor width
    },
    plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
            number = false,
            relativenumber = false,
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        tmux = { enabled = false }, -- disables the tmux statusline
        -- this will change the font size on kitty when in zen mode
        -- to make this work, you need to set the following kitty options:
        -- - allow_remote_control socket-only
        -- - listen_on unix:/tmp/kitty
        kitty = {
            enabled = false,
            font = "+4", -- font size increment
        },
    },
}

local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>gy', ':ZenMode<CR>', { noremap = true, silent = true })

-- EOF

