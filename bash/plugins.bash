#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : plugins.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : plugin manager


# Choose plugins
bash_plugins=(
    common
    completion
    docker
    emoji
    extract
    fzf
    git
    web_search
    z
)

# Load all of the plugins that were defined in ~/.oh-my-dotfiles/bash/oh-my-bash.bash
for bash_plugin in ${bash_plugins[@]}; do
    if [[ -f $OMB_HOME/plugins/$bash_plugin/$bash_plugin.bash ]]; then
        source $OMB_HOME/plugins/$bash_plugin/$bash_plugin.bash
    fi
done
unset bash_plugin
unset bash_plugins

# set thefuck environment
if command -v thefuck > /dev/null 2>&1; then
    eval $(thefuck --alias)
fi

# EOF

