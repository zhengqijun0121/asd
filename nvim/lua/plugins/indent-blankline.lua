-- Copyright (C) 2022. All rights reserved.
-- File name   : indent-blankline.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : indent-blankline configuration file


require("indent_blankline").setup {
    char = "┊",
    buftype_exclude = { "terminal" },
    -- Support Dashboard-nvim
    filetype_exclude = { "dashboard" },
}

-- EOF

