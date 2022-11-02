#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : .bashrc
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : an interactive non-login shell


# Judge ssh client connection
if [[ -n "$SSH_CLIENT" ]]; then
    if [[ -f ~/.bashrcbak ]]; then
        source ~/.bashrcbak
    fi
    return
fi

# Set oh_my_bash HOME
# OMB_HOME=/home/zhengqijun/.oh-my-dotfiles/bash
if [[ ! $OMB_HOME ]]; then
    OMB_HOME=~/.oh-my-dotfiles/bash
fi

if [[ -f $OMB_HOME/oh_my_bash.bash ]]; then
    source $OMB_HOME/oh_my_bash.bash
else
    echo -e "Please install \033[1;31moh_my_bash\033[0m\n"
    echo -e "\033[1;32mhttps://github.com/zhengqijun0121/dotfiles\033[0m\n"
fi

# EOF

