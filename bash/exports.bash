#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : exports.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : export environment


# You want $TERM to be screen-256color when tmux is running, and you want it to be xterm-256color when tmux is not running.
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM='gnome-256color'
elif [[ $TERM = screen* && -n $TMUX ]]; then
    export TERM='screen-256color'
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM='xterm-256color'
fi

# Make vim the default editor
export EDITOR=vim

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# File where history is saved
export HISTFILE=~/.bash_history

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=1000000

# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=100000

# set ranger file manager
export RANGER_LOAD_DEFAULT_RC=FALSE

# nvm environment
if [[ -d ~/.nvm ]]; then
    export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
    export NVM_IOJS_ORG_MIRROR=http://npm.taobao.org/mirrors/iojs
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# lsp environment
if [[ -d ~/.local/share/nvim/mason/bin ]]; then
    export PATH=~/.local/share/nvim/mason/bin:$PATH
fi

# set mongodb environment
if [[ -d /usr/local/mongodb/bin ]]; then
    export PATH=/usr/local/mongodb/bin:$PATH
fi

# set chrome environment
if [[ -d /opt/google/chrome ]]; then
    export PATH=/opt/google/chrome:$PATH
fi

# set default browser
if [[ -f /opt/google/chrome/google-chrome ]]; then
    export BROWSER=/opt/google/chrome/google-chrome:$BROWSER
fi

# set cmake environment
if [[ -d ~/Opt/cmake/bin ]]; then
    export PATH=~/Opt/cmake/bin:$PATH
fi

# set repo environment
if [[ -d ~/Opt/repo ]]; then
    export PATH=~/Opt/repo:$PATH
fi

# set android-studio environment
if [[ -d ~/Opt/android-studio/bin ]]; then
    export PATH=~/Opt/android-studio/bin:$PATH
fi

# set ndk environment
if [[ -d ~/Android/Sdk/ndk/23.1.7779620 ]]; then
    export PATH=~/Android/Sdk/ndk/23.1.7779620:$PATH
    export NDK_HOME=~/Android/Sdk/ndk/23.1.7779620
fi

# set ckbrew environment
if [[ "$(uname)" ==  "Darwin" ]]; then
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottles
    eval $(/opt/homebrew/bin/brew shellenv)
fi

# EOF

