#!/usr/bin/env zsh

# Copyright (C) 2021. All rights reserved.
# File name   : exports.zsh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2021-12-31
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

# Number of lines of history kept within the shell
# (default is 1000)
export HISTSIZE=100000

# File where history is saved
export HISTFILE=~/.zsh_history

# Number of lines of history to save to $HISTFILE.
export SAVEHIST=1000000

# ignore duplication command history list
setopt HIST_IGNORE_DUPS

#ignore space command history list
setopt HIST_IGNORE_SPACE

# set ranger file manager
export RANGER_LOAD_DEFAULT_RC=FALSE

# To opt in to Homebrew analytics, `unset` this in ~/.zshrc.local .
# Learn more about what you are opting in to at
# https://docs.brew.sh/Analytics
export HOMEBREW_NO_ANALYTICS=1

# lsp environment
if [[ -d ~/.local/share/nvim/mason/bin ]]; then
    export PATH=~/.local/share/nvim/mason/bin:$PATH
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

# set nvm environment
if [[ -d ~/.nvm ]]; then
    export NVM_DIR="$HOME/.nvm"
    # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    # This loads nvm bash_completion
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
fi

# EOF

