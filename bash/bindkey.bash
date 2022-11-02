#!/usr/bin/env bash

# Copyright (C) 2022. All rights reserved.
# File name   : bindkey.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2022-01-01
# Description : bash vi mode


# Use vi mode
set -o vi

# bind lists - `bind -p`

# emacs style
bind '"\C-a":beginning-of-line'
bind '"\C-e":end-of-line'
bind '"\C-b":backward-word'
bind '"\C-f":forward-word'
bind '"\C-j":history-search-backward'
bind '"\C-k":history-search-forward'
bind '"\C-l":clear-screen'
bind '"\e.":insert-last-argument'
bind '"jj":vi-movement-mode'

# bind commands
bind -x '"\eR":"bashrc"'
bind -x '"\eW":"who"'
bind -x '"\eP":"pwd"'

# EOF

