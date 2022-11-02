#!/usr/bin/env zsh

# Copyright (C) 2021. All rights reserved.
# File name   : bindkey.zsh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2021-12-31
# Description : key-bindings


# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html

# Use vi key bindings
bindkey -v

# Vi keymap
bindkey -M viins "jj" vi-cmd-mode

# Ctrl + V : get key value
# ^  : Ctrl
# ^[ : Alt
# 
 : Enter

# emacs style
bindkey '^a'  beginning-of-line
bindkey '^e'  end-of-line
bindkey '^f'  emacs-forward-word
bindkey '^b'  emacs-backward-word
bindkey '^j'  up-history
bindkey '^k'  down-history
bindkey '^[j' history-beginning-search-backward
bindkey '^[k' history-beginning-search-forward
bindkey '^I'  complete-word
bindkey '^w'  kill-region
bindkey '^[.' insert-last-word

# bind commands
bindkey -s "R" "zshrc
"
bindkey -s "W" "who
"
bindkey -s "P" "pwd
"

# Make numpad enter work
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# EOF

