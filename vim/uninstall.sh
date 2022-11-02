#!/usr/bin/env bash
# Copyright (C) 2019. All rights reserved.
# File name   : uninstall.sh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-08-26
# Description : my-vimrc uninstall script

function confirm() {
    while true; do
        read -p "$1" -n 1 -r
        echo
        if [[ "$REPLY" =~ ^[Yy] ]]; then
            return 0
        elif [[ "$REPLY" =~ ^[Nn] ]]; then
            return 1
        fi
    done
}

function uninstall() {
    rm -rf "$HOME/.vimrc"
    rm -rf "$HOME/.config/nvim"
    rm -rf "$HOME/.myvimrc"
}

function main() {
    echo -e "\033[31mUninstall my-vimrc (Y/N) ?\033[0m"
    if confirm; then
        # uninstall
        echo
        echo -e "\033[1;32m[✔] Uninstalled successfully. Thank you for using it!\033[0m"
        echo
    else
        echo
        echo -e "\033[1;32m[✘] Skipped!\033[0m"
        echo
    fi
}

# run main function
main

