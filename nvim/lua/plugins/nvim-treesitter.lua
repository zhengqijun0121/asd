-- Copyright (C) 2022. All rights reserved.
-- File name   : nvim-treesitter.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : nvim-treesitter configuration file

require('nvim-treesitter.configs').setup {
    -- :TSInstallInfo
    -- A list of parser names, or "all"
    ensure_installed = {
        "meson", "javascript", "c", "cpp", "cuda", "dockerfile", "lua", "python", "go", "bash", "java", "kotlin",
        "html", "json", "css", "scss", "todotxt", "typescript", "tsx", "markdown", "markdown_inline", "jsonc",
        "yaml", "regex", "comment", "sql", "latex", "cmake", "vim", "help", "json5", "llvm", "http", "prisma",
        "make", "proto",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    highlight = {
        enable = true,

        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        },
    },

    indent = {
        enable = true,
    },
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- EOF

