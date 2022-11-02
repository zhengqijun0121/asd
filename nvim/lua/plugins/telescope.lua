-- Copyright (C) 2022. All rights reserved.
-- File name   : telescope.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : telescope configuration file


require("telescope").setup({
    defaults = {
        borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
    },
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
        },
    },
})

-- require("telescope").load_extension("media_files")

local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

keymap("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],  opt)
keymap("n", "<Leader>fg", [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]],   opt)
keymap("n", "<Leader>fs", [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]], opt)
keymap("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]],     opt)
keymap("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]],   opt)
keymap("n", "<Leader>fm", [[<Cmd>lua require('telescope.builtin').marks()<CR>]],       opt)
keymap("n", "<Leader>fr", [[<Cmd>lua require('telescope.builtin').registers()<CR>]],   opt)
keymap("n", "<Leader>fk", [[<Cmd>lua require('telescope.builtin').keymaps()<CR>]],     opt)

-- highlights
local cmd = vim.cmd

cmd("hi TelescopeBorder        guifg=#2a2e36")
cmd("hi TelescopePromptBorder  guifg=#2a2e36")
cmd("hi TelescopeResultsBorder guifg=#2a2e36")
cmd("hi TelescopePreviewBorder guifg=#525865")

-- EOF

