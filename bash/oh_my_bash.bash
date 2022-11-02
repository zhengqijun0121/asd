#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : oh_my_bash.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : oh_my_bash
#                ___  _           __  __             _   ___     _____ __  __
#               / _ \| |__       |  \/  |_   _      | \ | \ \   / /_ _|  \/  |
#              | | | | '_ \ _____| |\/| | | | |_____|  \| |\ \ / / | || |\/| |
#              | |_| | | | |_____| |  | | |_| |_____| |\  | \ V /  | || |  | |
#               \___/|_| |_|     |_|  |_|\__, |     |_| \_|  \_/  |___|_|  |_|
#                                        |___/
#
#                          ███████████████████████████
#                          ███████▀▀▀░░░░░░░▀▀▀███████
#                          ████▀░░░░░░░░░░░░░░░░░▀████
#                          ███│░░░░░░░░░░░░░░░░░░░│███
#                          ██▌│░░░░░░░░░░░░░░░░░░░│▐██
#                          ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
#                          ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
#                          ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
#                          ██▌░│██████▌░░░▐██████│░▐██
#                          ███░│▐███▀▀░░▄░░▀▀███▌│░███
#                          ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
#                          ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
#                          ████▄─┘██▌░░░░░░░▐██└─▄████
#                          █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
#                          ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
#                          █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
#                          ███████▄░░░░░░░░░░░▄███████
#                          ██████████▄▄▄▄▄▄▄██████████
#                          ███████████████████████████


# Load the shell dotfiles, and then some:
# * ~/.oh-my-dotfiles/bash/.path can be used to extend `$PATH`.
# * ~/.oh-my-dotfiles/bash/.extra can be used for other settings you don’t want to commit.
for file in $OMB_HOME/{bindkey,prompt,exports,aliases,options,plugins}.bash; do
    if [[ -r "$file" && -f "$file" ]]; then
        source "$file"
    fi
done
unset file

# Avoid PATH duplication
export PATH=$(echo $PATH | tr : "\n" | sort | uniq | tr "\n" :)

# EOF

