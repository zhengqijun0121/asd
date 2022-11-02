#!/usr/bin/env zsh

# Copyright (C) 2021. All rights reserved.
# File name   : plugins.zsh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2021-12-31
# Description : plugin manager


# Choose plugins
zsh_plugins=(
    common
    docker
    emoji
    extract
    fzf
    git
    web_search
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load all of the plugins that were defined in ~/.oh-my-dotfiles/zsh/oh-my-zsh.zsh
for zsh_plugin in ${zsh_plugins[@]}; do
    if [[ -f $OMZ_HOME/plugins/$zsh_plugin/$zsh_plugin.zsh ]]; then
        source $OMZ_HOME/plugins/$zsh_plugin/$zsh_plugin.zsh
    fi
done
unset zsh_plugin
unset zsh_plugins

# set thefuck environment
if command -v thefuck > /dev/null 2>&1; then
    eval $(thefuck --alias)
fi

# EOF

