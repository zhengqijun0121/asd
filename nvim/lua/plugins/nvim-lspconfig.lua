-- Copyright (C) 2022. All rights reserved.
-- File name   : nvim-lspconfig.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : nvim-lspconfig configuration file


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<Space>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d',       '<Cmd>lua vim.diagnostic.goto_prev()<CR>',  opts)
keymap('n', ']d',       '<Cmd>lua vim.diagnostic.goto_next()<CR>',  opts)
keymap('n', '<Space>q', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <C-x><C-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD',        '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd',        '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K',         '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi',        '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>',     '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<Space>D',  '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<Space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr',        '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Space>f',  '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    "bashls",
    "clangd",
    "cmake",
    "dockerls",
    "jdtls",
    "marksman",
    "prismals",
    "pyright",
    "sumneko_lua",
    "texlab",
    "vimls",
    "yamlls",
}

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = lsp_flags,
    }
end

-- EOF

