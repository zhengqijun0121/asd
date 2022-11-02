-- Copyright (C) 2022. All rights reserved.
-- File name   : nvim-cmp.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : nvim-cmp configuration file


-- load snippets made by luasnip
require("../snippets/init")

local luasnip = require("luasnip")
local cmp = require("cmp")

-- Configure nvim-cmp
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<C-j>"] = cmp.mapping(function()
            luasnip.jump(1)
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
            luasnip.jump(-1)
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = 'emoji' },
        { name = 'cmp_tabnine' },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                luasnip = "[LuaSnip]",
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Path]",
                emoji = "[Emoji]",
                cmp_tabnine = "[TabNine]",
            })[entry.source.name]
            return vim_item
        end,
    },
})

-- EOF

