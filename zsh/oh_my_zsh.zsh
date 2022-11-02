#!/usr/bin/env bash

# Copyright (C) 2021. All rights reserved.
# File name   : oh_my_zsh.zsh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2021-12-31
# Description : oh_my_zsh


# Load the shell dotfiles, and then some:
# * ~/.oh-my-dotfiles/zsh/.path can be used to extend `$PATH`.
# * ~/.oh-my-dotfiles/zsh/.extra can be used for other settings you don’t want to commit.
for file in $OMZ_HOME/{bindkey,prompt,exports,aliases,options,plugins}.zsh; do
    if [[ -r "$file" && -f "$file" ]]; then
        source "$file"
    fi
done
unset file

# Avoid PATH duplication
export PATH=$(echo $PATH | tr : "\n" | sort | uniq | tr "\n" :)

# EOF

