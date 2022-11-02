-- Copyright (C) 2022. All rights reserved.
-- File name   : plugins.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : list of neovim plugins


-- Configure plugins
vim.g.omn_git = 'gitee'  -- gitee or github
vim.g.omn_plugins_enabled = true


if vim.g.omn_plugins_enabled then
    -- Download packer.nvim
    local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            if (vim.g.omn_git == 'github') then
                fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
            else
                fn.system({'git', 'clone', '--depth', '1', 'https://gitee.com/zhengqijun/packer.nvim', install_path})
            end

            -- Only required if you have packer configured as `opt`
            vim.cmd [[ packadd packer.nvim ]]

            return true
        end
        return false
    end

    local packer_bootstrap = ensure_packer()

    return require('packer').startup({
        function()
            if (vim.g.omn_git == 'github') then
                -- Packer can manage itself
                use 'wbthomason/packer.nvim'

                -- LSP
                use {
                    'williamboman/mason.nvim',
                    config = function() require('../plugins/mason') end,
                }

                use {
                    'williamboman/mason-lspconfig.nvim',
                    config = function() require('../plugins/mason-lspconfig') end,
                }

                use {
                    'neovim/nvim-lspconfig',
                    config = function() require('../plugins/nvim-lspconfig') end,
                }

                use {
                    'glepnir/lspsaga.nvim',
                    config = function() require('../plugins/lspsaga') end,
                }

                use {
                    "ray-x/lsp_signature.nvim",
                    config = function() require('../plugins/lsp_signature') end,
                }

                -- Auto Completion
                use {
                    'hrsh7th/nvim-cmp',
                    requires = {
                        'hrsh7th/cmp-path',
                        'hrsh7th/cmp-emoji',
                        'hrsh7th/cmp-buffer',
                        'hrsh7th/cmp-nvim-lsp',
                        'saadparwaiz1/cmp_luasnip',
                        'L3MON4D3/LuaSnip',
                    },
                    config = function() require('../plugins/nvim-cmp') end,
                }

                -- TabNine
                use {
                    'tzachar/cmp-tabnine',
                    run = './install.sh',
                    requires = 'hrsh7th/nvim-cmp',
                    event = 'InsertEnter',
                    config = function() require('../plugins/cmp-tabnine') end,
                }

                -- Markdown
                use {
                    'iamcco/markdown-preview.nvim',
                    run = 'cd app && yarn install',
                    ft = { 'md', 'markdown' },
                    config = function() require('../plugins/markdown-preview') end,
                }

                -- Autopairs
                use {
                    'windwp/nvim-autopairs',
                    requires = 'hrsh7th/nvim-cmp',
                    event = 'InsertEnter',
                    config = function() require('../plugins/nvim-autopairs') end,
                }

                -- Comment
                use {
                    'folke/todo-comments.nvim',
                    requires = 'nvim-lua/plenary.nvim',
                    config = function()
                        require('../plugins/todo-comments')
                        require('../plugins/mini-comment').setup()
                    end,
                }

                -- Surroundings
                use {
                    'ur4ltz/surround.nvim',
                    config = function() require('../plugins/surround') end,
                }

                -- Motion
                use {
                    'ggandor/lightspeed.nvim',
                    config = function() require('../plugins/lightspeed') end,
                }

                -- Multiple cursors
                use {
                    'mg979/vim-visual-multi',
                    config = function() require('../plugins/vim-visual-multi') end,
                }

                -- File explore
                use {
                    'kyazdani42/nvim-tree.lua',
                    requires = {
                        'kyazdani42/nvim-web-devicons',
                    },
                    config = function() require('../plugins/nvim-tree') end,
                }

                -- Code outline
                -- use {
                --     'stevearc/aerial.nvim',
                --     config = function() require('../plugins/aerial') end,
                -- }
                use {
                    'simrat39/symbols-outline.nvim',
                    config = function() require('../plugins/symbols-outline') end,
                }

                -- Tmux smoothly navigate
                use {
                    'numToStr/Navigator.nvim',
                    config = function() require('../plugins/Navigator') end,
                }

                -- Fuzzy finder
                use 'nvim-lua/plenary.nvim'
                use {
                    'nvim-telescope/telescope.nvim',
                    requires = 'nvim-lua/plenary.nvim',
                    config = function() require('../plugins/telescope') end,
                }
                -- use {
                --     'telescope-file-browser.nvim',
                --     requires = {
                --         'nvim-lua/plenary.nvim',
                --         'nvim-telescope/telescope.nvim',
                --     },
                -- }

                -- Indent
                use {
                    'lukas-reineke/indent-blankline.nvim',
                    ft = { 'lua', 'python' },
                    config = function() require('../plugins/indent-blankline') end,
                }

                -- Treesitter
                use {
                    'nvim-treesitter/nvim-treesitter',
                    -- run = ':TSUpdate',
                    config = function() require('../plugins/nvim-treesitter') end,
                }

                -- Git
                use {
                    'f-person/git-blame.nvim',
                    config = function() require('../plugins/git-blame') end,
                }

                -- Diff
                use {
                    'sindrets/diffview.nvim',
                    config = function() require('../plugins/diffview') end,
                }

                -- Undo
                use {
                    'jiaoshijie/undotree',
                    config = function() require('../plugins/undotree') end,
                }

                -- Zen-Mode
                use {
                    'folke/zen-mode.nvim',
                    config = function() require('../plugins/zen-mode') end,
                }

                -- Last place
                use {
                    'ethanholz/nvim-lastplace',
                    config = function() require('../plugins/nvim-lastplace') end,
                }

                -- Keybinding
                use {
                    'folke/which-key.nvim',
                    config = function() require('../plugins/which-key') end,
                }

                -- Startup
                use {
                    'glepnir/dashboard-nvim',
                    config = function() require('../plugins/dashboard-nvim') end,
                }

                -- Bufferline
                use {
                    'akinsho/bufferline.nvim',
                    config = function() require('../plugins/bufferline') end,
                }

                -- Statusline
                use {
                    'nvim-lualine/lualine.nvim',
                    config = function() require('../plugins/lualine') end,
                }

                -- Colorscheme
                use {
                    'tanvirtin/monokai.nvim',
                    config = function() require('../plugins/monokai') end,
                }

                -- Startuptime
                use 'dstein64/vim-startuptime'
            else
                -- Packer can manage itself
                use 'zhengqijun/packer.nvim'

                -- LSP
                use {
                    'zhengqijun/mason.nvim',
                    config = function() require('../plugins/mason') end,
                }

                use {
                    'zhengqijun/mason-lspconfig.nvim',
                    config = function() require('../plugins/mason-lspconfig') end,
                }

                use {
                    'zhengqijun/nvim-lspconfig',
                    config = function() require('../plugins/nvim-lspconfig') end,
                }

                use {
                    'zhengqijun/lspsaga.nvim',
                    config = function() require('../plugins/lspsaga') end,
                }

                use {
                    "zhengqijun/lsp_signature.nvim",
                    config = function() require('../plugins/lsp_signature') end,
                }

                -- Auto Completion
                use {
                    'zhengqijun/nvim-cmp',
                    requires = {
                        'zhengqijun/cmp-path',
                        'zhengqijun/cmp-emoji',
                        'zhengqijun/cmp-buffer',
                        'zhengqijun/cmp-nvim-lsp',
                        'zhengqijun/cmp_luasnip',
                        'zhengqijun/LuaSnip',
                    },
                    config = function() require('../plugins/nvim-cmp') end,
                }

                -- TabNine
                use {
                    'zhengqijun/cmp-tabnine',
                    run = './install.sh',
                    requires = 'zhengqijun/nvim-cmp',
                    event = 'InsertEnter',
                    config = function() require('../plugins/cmp-tabnine') end,
                }

                -- Markdown
                use {
                    'zhengqijun/markdown-preview.nvim',
                    run = 'cd app && yarn install',
                    ft = { 'md', 'markdown' },
                    config = function() require('../plugins/markdown-preview') end,
                }

                -- Autopairs
                use {
                    'zhengqijun/nvim-autopairs',
                    requires = 'zhengqijun/nvim-cmp',
                    event = 'InsertEnter',
                    config = function() require('../plugins/nvim-autopairs') end,
                }

                -- Comment
                use {
                    'zhengqijun/todo-comments.nvim',
                    requires = 'zhengqijun/plenary.nvim',
                    config = function()
                        require('../plugins/todo-comments')
                        require('../plugins/mini-comment').setup()
                    end,
                }

                -- Surroundings
                use {
                    'zhengqijun/surround.nvim',
                    config = function() require('../plugins/surround') end,
                }

                -- Motion
                use {
                    'zhengqijun/lightspeed.nvim',
                    config = function() require('../plugins/lightspeed') end,
                }

                -- Multiple cursors
                use {
                    'zhengqijun/vim-visual-multi',
                    config = function() require('../plugins/vim-visual-multi') end,
                }

                -- File explore
                use {
                    'zhengqijun/nvim-tree.lua',
                    requires = {
                        'zhengqijun/nvim-web-devicons',
                    },
                    config = function() require('../plugins/nvim-tree') end,
                }

                -- Code outline
                -- use {
                --     'zhengqijun/aerial.nvim',
                --     config = function() require('../plugins/aerial') end,
                -- }
                use {
                    'zhengqijun/symbols-outline.nvim',
                    config = function() require('../plugins/symbols-outline') end,
                }

                -- Tmux smoothly navigate
                use {
                    'zhengqijun/Navigator.nvim',
                    config = function() require('../plugins/Navigator') end,
                }

                -- Fuzzy finder
                use 'zhengqijun/plenary.nvim'
                use {
                    'zhengqijun/telescope.nvim',
                    requires = 'zhengqijun/plenary.nvim',
                    config = function() require('../plugins/telescope') end,
                }

                -- Indent
                use {
                    'zhengqijun/indent-blankline.nvim',
                    ft = { 'lua', 'python' },
                    config = function() require('../plugins/indent-blankline') end,
                }

                -- Treesitter
                use {
                    'zhengqijun/nvim-treesitter',
                    -- branch = 'custom',
                    -- run = ':TSUpdate',
                    config = function()
                        require('../plugins/nvim-treesitter-proxy')
                        require('../plugins/nvim-treesitter')
                    end,
                }

                -- Git
                use {
                    'zhengqijun/git-blame.nvim',
                    config = function() require('../plugins/git-blame') end,
                }

                -- Diff
                use {
                    'zhengqijun/diffview.nvim',
                    config = function() require('../plugins/diffview') end,
                }

                -- Undo
                use {
                    'zhengqijun/undotree.nvim',
                    config = function() require('../plugins/undotree') end,
                }

                -- Zen-Mode
                use {
                    'zhengqijun/zen-mode.nvim',
                    config = function() require('../plugins/zen-mode') end,
                }

                -- Last place
                use {
                    'zhengqijun/nvim-lastplace',
                    config = function() require('../plugins/nvim-lastplace') end,
                }

                -- Keybinding
                use {
                    'zhengqijun/which-key.nvim',
                    config = function() require('../plugins/which-key') end,
                }

                -- Startup
                use {
                    'zhengqijun/dashboard-nvim',
                    config = function() require('../plugins/dashboard-nvim') end,
                }

                -- Bufferline
                use {
                    'zhengqijun/bufferline.nvim',
                    config = function() require('../plugins/bufferline') end,
                }

                -- Statusline
                use {
                    'zhengqijun/lualine.nvim',
                    config = function() require('../plugins/lualine') end,
                }

                -- Colorscheme
                use {
                    'zhengqijun/monokai.nvim',
                    config = function() require('../plugins/monokai') end,
                }

                -- Startuptime
                use 'zhengqijun/vim-startuptime'
            end

            -- Automatically set up your configuration after cloning packer.nvim
            -- Put this at the end after all plugins
            -- if packer_bootstrap then
            --     require('packer').sync()
            -- end
            -- [[ nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' ]]
        end,
        config = {
            git = {
                -- default_url_format = 'https://github.com/%s'
                default_url_format = 'https://gitee.com/%s'
            },
            display = {
                open_fn = function()
                    return require('packer.util').float({ border = 'single' })
                end
            },
            require('../plugins/packer')
        }
    })
end

-- EOF

