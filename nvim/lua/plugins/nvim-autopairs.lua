-- Copyright (C) 2022. All rights reserved.
-- File name   : nvim-autopairs.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : nvim-autopairs configuration file


require("nvim-autopairs").setup()

local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- EOF

