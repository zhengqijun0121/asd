-- Copyright (C) 2022. All rights reserved.
-- File name   : lualine.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : lualine configuration file


require('lualine').setup {
    options = {
        theme = 'gruvbox_dark',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
    },
}

-- EOF

