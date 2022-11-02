-- Copyright (C) 2022. All rights reserved.
-- File name   : nvim-lastplace.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : nvim-lastplace configuration file


require('nvim-lastplace').setup {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
}

-- EOF

