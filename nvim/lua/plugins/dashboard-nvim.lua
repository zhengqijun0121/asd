-- Copyright (C) 2022. All rights reserved.
-- File name   : dashboard-nvim.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-01-10
-- Description : dashboard-nvim configuration file


local home = os.getenv('HOME')
local db = require('dashboard')

db.custom_center = {
    {
        icon = '  ',
        desc = 'Recently latest session                 ',
        action ='SessionLoad',
        shortcut = 'SPC d l'
    },
    {
        icon = '  ',
        desc = 'Recently Opened Files                   ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC d h'
    },
    {
        icon = '  ',
        desc = 'Find File                               ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'SPC d f'
    },
    {
        icon = '  ',
        desc = 'New Files                               ',
        action = 'DashboardNewFile',
        shortcut = 'SPC d n'
    },
    {
        icon = '  ',
        desc = 'Find Word                               ',
        action = 'Telescope live_grep',
        shortcut = 'SPC d w'
    },
    {
        icon = '  ',
        desc = 'Open Personal Dotfiles                  ',
        action = 'edit '.. home ..'/.oh-my-dotfiles/nvim',
        shortcut = 'SPC d d'
    },
    {
        icon = '  ',
        desc = 'Colorscheme                             ',
        action = 'Telescope colorscheme',
        shortcut = 'SPC d c'
    },
}

-- EOF

