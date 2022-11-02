-- Copyright (C) 2022. All rights reserved.
-- File name   : nvim-tree.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : nvim-tree configuration file


local tree_cb = require('nvim-tree.config').nvim_tree_callback
local custom_list = {
    { key = "O",                cb = tree_cb("edit")..tree_cb("refresh") },
    { key = "<CR>",             cb = tree_cb("edit_no_picker")..tree_cb("refresh") },
    { key = "o",                cb = tree_cb("edit_no_picker")..tree_cb("refresh") },
    { key = "<2-LeftMouse>",    cb = tree_cb("edit_no_picker")..tree_cb("refresh") },
    { key = "<2-RightMouse>",   cb = tree_cb("cd") },
    { key = "<C-]>",            cb = tree_cb("cd") },
    { key = "<C-v>",            cb = tree_cb("vsplit") },
    { key = "<C-x>",            cb = tree_cb("split") },
    { key = "<C-t>",            cb = tree_cb("tabnew") },
    { key = "<",                cb = tree_cb("prev_sibling") },
    { key = ">",                cb = tree_cb("next_sibling") },
    { key = "P",                cb = tree_cb("parent_node") },
    { key = "<BS>",             cb = tree_cb("close_node") },
    { key = "<Tab>",            cb = tree_cb("preview") },
    { key = "K",                cb = tree_cb("first_sibling") },
    { key = "J",                cb = tree_cb("last_sibling") },
    { key = "I",                cb = tree_cb("toggle_ignored") },
    { key = ".",                cb = tree_cb("toggle_dotfiles") },
    { key = "R",                cb = tree_cb("refresh") },
    { key = "a",                cb = tree_cb("create") },
    { key = "d",                cb = tree_cb("remove") },
    { key = "D",                cb = tree_cb("trash") },
    { key = "r",                cb = tree_cb("rename") },
    { key = "<C-r>",            cb = tree_cb("full_rename") },
    { key = "x",                cb = tree_cb("cut") },
    { key = "yy",               cb = tree_cb("copy") },
    { key = "p",                cb = tree_cb("paste") },
    { key = "yn",               cb = tree_cb("copy_name") },
    { key = "yp",               cb = tree_cb("copy_path") },
    { key = "ya",               cb = tree_cb("copy_absolute_path") },
    { key = "[c",               cb = tree_cb("prev_git_item") },
    { key = "]c",               cb = tree_cb("next_git_item") },
    { key = "-",                cb = tree_cb("dir_up") },
    { key = "s",                cb = tree_cb("system_open") },
    { key = "q",                cb = tree_cb("close") },
    { key = "<C-e>",            cb = tree_cb("close") },
    { key = "?",                cb = tree_cb("toggle_help") },
}

require("nvim-tree").setup {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            custom_only = true,
            list = custom_list,
        },
    },
    renderer = {
        group_empty = true,
        highlight_opened_files = "all",
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    filters = {
        dotfiles = true,
        custom = { ".git", "node_modules", ".DS_Store" },
    },
}

-- Mappings for nvimtree
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- EOF

