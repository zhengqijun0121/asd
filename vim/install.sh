#!/usr/bin/env bash
# Copyright (C) 2019. All rights reserved.
# File name   : install.sh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-08-26
# Description : my-vimrc install script


set -eo pipefail

app_name="my-vimrc"
repo_uri="https://github.com/codeMonkeyss/my-vimrc.git"
repo_name="my-vimrc"
repo_path="$HOME/.myvimrc"
repo_branch="master"
user_vim="$HOME/.vim"
user_vimrc="$HOME/.vimrc"

_all=
_vim=
_neovim=
_update=


###############################################################################
#                                Basic tools                                  #
###############################################################################
function msg() {
    printf '%b\n' "$1" >&2
}

function success() {
    if [ "$ret" -eq '0' ]; then
        msg "\\33[32m[✔]\\33[0m ${1}${2}"
    fi
}

function error() {
    msg "\\33[31m[✘]\\33[0m ${1}${2}"
    exit 1
}

function debug() {
    if [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

function variable_set() {
    if [ -z "$1" ]; then
        error "You must have your HOME environmental variable set to continue."
    fi
}

function lnsf() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi

    debug
}

function program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ "$ret" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

function repo_sync() {
    if [ ! -e "$repo_path" ]; then
        msg "\\033[1;34m==>\\033[0m Trying to clone $repo_name"
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path" --depth=1
        ret="$?"
        success "Successfully cloned $repo_name."
    else
        msg "\\033[1;34m==>\\033[0m Trying to update $repo_name"
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi

    if [ ! -z "$_update" ]; then
        exit 0;
    fi

    debug
}

function install_plugins() {
    for exe in "$@"; do
        eval "$exe +PlugInstall +qall"
    done

    ret="$?"
    echo
    success "Successfully installed plugins via vim-plug"
    debug
}

function generate_dot_myvimrc() {
    if [ ! -f "$HOME/.vim" ]; then
        cp -rf "$repo_path/vimrc" "$user_vimrc"
        cp -rf "$repo_path/config" "$user_vim"
        cp -rf "$repo_path/files" "$user_vim"
        mkdir -p "$user_vim/files/backup"
        mkdir -p "$user_vim/files/undodir"
        mkdir -p "$user_vim/files/vimwiki"

        ret="$?"
        echo
        success "Successfully generated .vimrc in your home directory"
        debug
    fi
}

function backup() {
    if [ -e "$1" ]; then
        msg "\\033[1;34m==>\\033[0m Attempting to back up your original vim configuration"
        today=$(date +%Y%m%d_%s)
        mv -v "$1" "$1.$today"

        ret="$?"
        success "Your original vim configuration has been backed up"
        debug
        echo
    fi
}

function install_for_vim() {
    backup "$HOME/.vimrc"
    backup "$HOME/.vim"

    msg "\\033[1;34m==>\\033[0m Trying to download vim-plug"

    if [ ! -e "~/.vim/autoload/plug.vim" ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    ret="$?"
    success "Successfully downloaded vim-plug"
    debug

    # lnsf "$HOME/.myvimrc/vimrc" "$HOME/.vimrc"
    generate_dot_myvimrc

    install_plugins "vim"
}

function install_for_neovim() {
    backup "$HOME/.config/nvim/init.vim"

    msg "\\033[1;34m==>\\033[0m Trying to download vim-plug"

    if [ ! -e "~/.vim/autoload/plug.vim" ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    ret="$?"
    echo
    success "Successfully downloaded vim-plug"
    debug

    mkdir -p "$HOME/.config/nvim"
    # lnsf "$HOME/.myvimrc/init.vim" "$HOME/.config/nvim/init.vim"
    generate_dot_myvimrc
    lnsf "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"

    install_plugins "nvim"
}

function infer() {
    if program_exists "vim" && program_exists "nvim"; then
        echo
        msg "\\033[1;34m==>\\033[0m Find both 'vim' and 'nvim' in your system"
        while true; do
            read -r -p "    Install my-vimrc for: [0]vim [1]nvim [2]vim and nvim :" opt
            case $opt in
                0)
                    install_for_vim
                    break
                    ;;
                1)
                    install_for_neovim
                    break
                    ;;
                2)
                    install_for_vim
                    install_for_neovim
                    break
                    ;;
                *)
                    echo "Please answer 0, 1 or 2"
                    ;;
            esac
        done
    elif program_exists "vim"; then
        echo
        msg "\\033[1;34m==>\\033[0m Only find 'vim' in your system"
        msg "    Starting to install my-vimrc for 'vim'"
        install_for_vim
    elif program_exists "nvim"; then
        echo
        msg "\\033[1;34m==>\\033[0m Only find 'nvim' in your system"
        msg "    Starting to install my-vimrc for 'nvim'"
        install_for_neovim
    else
        error "You must have 'vim' or 'nvim' installed to continue"
    fi
}

function install() {
    if [ ! -z "$_all" ]; then
        install_for_vim
        install_for_neovim
        return
    fi

    if [ ! -z "$_vim" ]; then
        install_for_vim
    fi

    if [ ! -z "$_neovim" ]; then
        install_for_neovim
    fi

    # infer
}

function help() {
cat << EOF
usage: $0 [OPTIONS]
    --help               Show this message
    --all                Install my-vimrc for Vim and NeoVim
    --vim                Install my-vimrc for Vim
    --neovim             Install my-vimrc for NeoVim
    --update             Update my-vimrc
EOF
}

function main() {
    opt=$1
    case $opt in
        --help)
            help
            exit 0
            ;;
        --all)           _all=1    ;;
        --vim)           _vim=1    ;;
        --neovim)        _neovim=1 ;;
        --update)        _update=1 ;;
        *)
            echo "unknown option: $opt"
            help
            exit 1
            ;;
    esac

    # Set HOME environment variable
    variable_set "$HOME"

    # Check tools
    program_exists "vim"
    program_exists "git"
    program_exists "make"
    program_exists "python"
    program_exists "python3"

    if [ _update == 1 ]; then
        # Repo Sync
        repo_sync
    else
        # Install
        install

        # Finish
        msg "\\nThanks for installing \\033[1;32m$app_name\\033[0m. Enjoy!"
        echo
    fi
}

# run main function
if [ $# == 1 ]; then
    main $1
else
    help
fi

