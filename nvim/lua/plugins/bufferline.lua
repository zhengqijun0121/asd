-- Copyright (C) 2022. All rights reserved.
-- File name   : bufferline.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-03-15
-- Description : bufferline configuration file


local keymap = vim.api.nvim_set_keymap

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
keymap('n', '<Leader>b[', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b]', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- These commands will move the current buffer backwards or forwards in the bufferline
keymap('n', '<Leader>b{', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b}', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

-- These commands will sort buffers by directory, language, or a custom criteria
keymap('n', '<Leader>bse', ':BufferLineSortByExtension<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>bsd', ':BufferLineSortByDirectory<CR>', { noremap = true, silent = true })

-- Select a buffer by it's visible position in the bufferline
keymap('n', '<Leader>bp', ':BufferLinePick<CR>',         { noremap = true, silent = true })
keymap('n', '<Leader>b1', ':BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b2', ':BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b3', ':BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b4', ':BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b5', ':BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b6', ':BufferLineGoToBuffer 6<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b7', ':BufferLineGoToBuffer 7<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b8', ':BufferLineGoToBuffer 8<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>b9', ':BufferLineGoToBuffer 9<CR>', { noremap = true, silent = true })

require('bufferline').setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "none",
        -- number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains:
              -- name                | str        | the basename of the active file
              -- path                | str        | the full path of the active file
              -- bufnr (buffer only) | int        | the number of the active buffer
              -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
              -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
            -- filter out by it's index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
                return true
            end
        end,
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
        }},
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
        -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --     -- add custom logic
        --     return buffer_a.modified > buffer_b.modified
        -- end
    }
}

-- EOF

