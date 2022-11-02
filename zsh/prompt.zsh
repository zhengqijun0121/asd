#!/usr/bin/env zsh

# Copyright (C) 2021. All rights reserved.
# File name   : prompt.zsh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2021-12-31
# Description : zsh prompt


# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

function load_theme() {
    # Use starship instead of ubuntu themes
    # https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz
    if [[ "$(uname)" == "Darwin" ]]; then
        if [[ "$(uname -m)" == "arm64" ]]; then
            if [[ -d $OMZ_HOME/../starship/bin/macos/aarch64 ]]; then
                export PATH=$OMZ_HOME/../starship/bin/macos/aarch64:$PATH
                export STARSHIP_CONFIG=$OMZ_HOME/../starship/config/config.toml
                eval "$(starship init zsh)"
            fi
        elif [[ "$(uname -m)" == "x86_64" ]]; then
            if [[ -d $OMZ_HOME/../starship/bin/macos/x86_64 ]]; then
                export PATH=$OMZ_HOME/../starship/bin/macos/x86_64:$PATH
                export STARSHIP_CONFIG=$OMZ_HOME/../starship/config/config.toml
                eval "$(starship init zsh)"
            fi
        else
            echo "Please install startship!"
        fi
    else
        if [[ "$(uname -m)" == "aarch64" ]]; then
            if [[ -d $OMZ_HOME/../starship/bin/linux/aarch64 ]]; then
                export PATH=$OMZ_HOME/../starship/bin/linux/aarch64:$PATH
                export STARSHIP_CONFIG=$OMZ_HOME/../starship/config/config.toml
                eval "$(starship init zsh)"
            fi
        elif [[ "$(uname -m)" == "x86_64" ]]; then
            if [[ -d $OMZ_HOME/../starship/bin/linux/x86_64 ]]; then
                export PATH=$OMZ_HOME/../starship/bin/linux/x86_64:$PATH
                export STARSHIP_CONFIG=$OMZ_HOME/../starship/config/config.toml
                eval "$(starship init zsh)"
            fi
        else
            echo "Please install startship!"
        fi
    fi
}

load_theme
unset load_theme

# EOF

