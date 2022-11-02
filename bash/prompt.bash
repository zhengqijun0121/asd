#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : prompt.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : bash prompt


# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

function load_theme() {
    # Use starship instead of ubuntu themes
    # https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz
    if [[ "$(uname)" == "Darwin" ]]; then
        if [[ "$(uname -m)" == "arm64" ]]; then
            if [[ -d $OMB_HOME/../starship/bin/macos/aarch64 ]]; then
                export PATH=$OMB_HOME/../starship/bin/macos/aarch64:$PATH
                export STARSHIP_CONFIG=$OMB_HOME/../starship/config/config.toml
                eval "$(starship init bash)"
            fi
        elif [[ "$(uname -m)" == "x86_64" ]]; then
            if [[ -d $OMB_HOME/../starship/bin/macos/x86_64 ]]; then
                export PATH=$OMB_HOME/../starship/bin/macos/x86_64:$PATH
                export STARSHIP_CONFIG=$OMB_HOME/../starship/config/config.toml
                eval "$(starship init bash)"
            fi
        else
            echo "Please install startship!"
        fi
    else
        if [[ "$(uname -m)" == "aarch64" ]]; then
            if [[ -d $OMB_HOME/../starship/bin/linux/aarch64 ]]; then
                export PATH=$OMB_HOME/../starship/bin/linux/aarch64:$PATH
                export STARSHIP_CONFIG=$OMB_HOME/../starship/config/config.toml
                eval "$(starship init bash)"
            fi
        elif [[ "$(uname -m)" == "x86_64" ]]; then
            if [[ -d $OMB_HOME/../starship/bin/linux/x86_64 ]]; then
                export PATH=$OMB_HOME/../starship/bin/linux/x86_64:$PATH
                export STARSHIP_CONFIG=$OMB_HOME/../starship/config/config.toml
                eval "$(starship init bash)"
            fi
        else
            echo "Please install startship!"
        fi
    fi

    # local theme_name="emojipedia"
    #
    # if [[ -f $OMB_HOME/themes/$theme_name/$theme_name.bash ]]; then
    #     source $OMB_HOME/themes/$theme_name/$theme_name.bash
    # fi
}

load_theme
unset load_theme

# EOF

