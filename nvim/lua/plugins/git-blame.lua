-- Copyright (C) 2022. All rights reserved.
-- File name   : git-blame.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : git-blame configuration file


vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = '%y/%m/%d %H:%M'
vim.g.gitblame_message_template = '    👉 <author> • <date> • <summary>'

vim.api.nvim_set_keymap('n', '<Leader>bt', ':GitBlameToggle<CR>', { noremap = true, silent = false })

-- EOF

