-- Copyright (C) 2022. All rights reserved.
-- File name   : init.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : init snippet file


require("luasnip").add_snippets(nil, {
    c = require("snippets/c"),
    cpp = require("snippets/cpp"),
    markdown = require("snippets/markdown"),
})

-- EOF

