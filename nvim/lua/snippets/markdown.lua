-- Copyright (C) 2022. All rights reserved.
-- File name   : markdown.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-02-14
-- Description : markdown snippet file


local ls = require('luasnip')
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require('luasnip.extras').lambda
local r = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require('luasnip.util.types')
local conds = require('luasnip.extras.expand_conditions')

local expand = vim.fn.expand
local strftime = vim.fn.strftime

local function copy(args)
    return args[1]
end

return {
    -- [ File Header]
    -- hdr
    s('hdr', {
        t( '# Copyright (C) '), t(strftime("%Y")), t({'. All rights reserved.', ''}),
        t( '# File name     : '), t(expand("%:t")), t({'', ''}),
        t( '# Version       : '), i(1, 'v1.0'), t({'', ''}),
        t( '# Author        : '), i(2, 'zhengqijun'), t({'', ''}),
        t( '# Date          : '), t(strftime("%Y-%m-%d")), t({'', ''}),
        t({'# Function List :', ''}),
        t( '# Description   : '), i(3), t({'', ''}),
    }),
}

-- EOF

