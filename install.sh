#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : install.sh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-22
# Description : Oh-My-Dotfiles


set -eo pipefail
# set -x

app_name="oh-my-dotfiles"
repo_url="https://github.com/zhengqijun0121/oh-my-dotfiles.git"
repo_name="dotfiles"
repo_path="$HOME/.oh_my_dotfiles"
repo_branch="master"

user_vim="$HOME/.vim"
user_vimrc="$HOME/.vimrc"

_all=
_i3=
_vim=
_git=
_pip=
_bash=
_tmux=
_ranger=
_update=


###############################################################################
#                                Basic tools                                  #
###############################################################################
function oh_my_dotfiles() {
    echo
    echo -e "[0;1;35;95m┏━[0;1;31;91m┓╻ [0;1;33;93m╻\t[0;1;32;92m┏[0;1;36;96m┳┓[0;1;35;95m╻ [0;1;31;91m╻\t[0;1;33;93m┳[0;1;32;92m━┓[0;1;36;96m┏━[0;1;34;94m┓[0;1;35;95m╺┳[0;1;31;91m╸[0;1;32;92m┏━[0;1;36;96m╸[0;1;34;94m╻ [0;1;35;95m╻ [0;1;31;91m ┏[0;1;33;93m━╸[0;1;32;92m┏━[0;1;36;96m┓ [0;1;34;94m[0m"
    echo -e "[0;1;31;91m┃ [0;1;33;93m┃┣━[0;1;32;92m┫\t[0;1;36;96m┃[0;1;34;94m┃┃[0;1;31;91m┗━[0;1;33;93m┫\t[0;1;32;92m┃[0;1;36;96m ┃[0;1;34;94m┃ [0;1;35;95m┃[0;1;31;91m ┃[0;1;36;96m [0;1;34;94m┣━[0;1;35;95m╸[0;1;31;91m┃ [0;1;33;93m┃ [0;1;32;92m ┣[0;1;36;96m━╸[0;1;34;94m┗━[0;1;35;95m┓ [0;1;31;91m[0m"
    echo -e "[0;1;33;93m┗━[0;1;32;92m┛╹ [0;1;36;96m╹\t[0;1;34;94m╹[0;1;35;95m ╹[0;1;33;93m┗━[0;1;32;92m┛\t[0;1;36;96m┻[0;1;34;94m━┛[0;1;35;95m┗━[0;1;31;91m┛[0;1;33;93m ╹[0;1;32;92m [0;1;34;94m╹ [0;1;35;95m [0;1;31;91m╹ [0;1;33;93m┗━[0;1;32;92m╸┗[0;1;36;96m━╸[0;1;34;94m┗━[0;1;35;95m┛ [0;1;31;91m[0m"
    echo
}

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

function program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ "$ret" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

function repo_sync() {
    msg "\\033[1;34m==>\\033[0m Trying to update oh-my-dotfiles"
    echo

    if [ ! -e "$repo_path" ]; then
        msg "\\033[1;34m==>\\033[0m Trying to clone $repo_name"
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path" --depth=1
        ret="$?"
        echo
        success "Successfully cloned $repo_name."
    else
        msg "\\033[1;34m==>\\033[0m Trying to update $repo_name"
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        echo
        success "Successfully updated $repo_name"
    fi

    if [ ! -z "$_update" ]; then
        exit 0;
    fi

    debug
}

function install_for_i3() {
    if [ ! -d "$HOME/.config/i3" ]; then
        mkdir -p "$HOME/.config/i3"
    fi

    if [ ! -d "$HOME/.config/i3status" ]; then
        mkdir -p "$HOME/.config/i3status"
    fi

    if [ -f "$HOME/.i3status.conf" ]; then
        rm -f "$HOME/.i3status.conf"
    fi

    cp -f "$repo_path/i3/i3/config"       "$HOME/.config/i3/config"
    cp -f "$repo_path/i3/i3status/config" "$HOME/.config/i3status/config"

    ret="$?"
    echo
    success "Successfully installed i3 configure file"
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

function install_for_vim() {
    echo
    msg "\\033[1;34m==>\\033[0m Trying to download vim-plug"

    if [ ! -e "$user_vim/autoload/plug.vim" ]; then
        curl -fLo $user_vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    ret="$?"
    success "Successfully downloaded vim-plug"
    debug

    if [ ! -d "$user_vim" ]; then
        mkdir -p "$user_vim"
    fi

    cp -f "$repo_path/vim/vimrc"  "$user_vimrc"
    ln -s "$repo_path/vim/colors" "$user_vim/colors"

    ret="$?"
    echo
    success "Successfully installed vim configure file"
    debug

    # Do not install vim plugins to improve speed
    # install_plugins "vim"
}

function install_for_git() {
    cp -f "$repo_path/git/gitconfig"  "$HOME/.gitconfig"
    cp -f "$repo_path/git/gitignore"  "$HOME/.gitignore"
    cp -f "$repo_path/git/gitmessage" "$HOME/.gitmessage"

    ret="$?"
    echo
    success "Successfully installed git configure file"
    debug
}

function install_for_pip() {
    if [[ ! -d "$HOME/.pip" ]]; then
        mkdir -p "$HOME/.pip"
    fi

    cp -f "$repo_path/pip/pip.conf"  "$HOME/.pip/pip.conf"

    ret="$?"
    echo
    success "Successfully installed pip configure file"
    debug
}

function install_for_bash() {
    cp -f "$repo_path/bash/bashrc.bash" "$HOME/.bashrc"

    ret="$?"
    echo
    success "Successfully installed bash configure file"
    debug
}

function install_for_tmux() {
    cp -f "$repo_path/tmux/tmux.conf"       "$HOME/.tmux.conf"
    cp -f "$repo_path/tmux/tmux.conf.local" "$HOME/.tmux.conf.local"

    ret="$?"
    echo
    success "Successfully installed tmux configure file"
    debug
}

function install_for_ranger() {
    if [ ! -d "$HOME/.config/ranger" ]; then
        mkdir -p "$HOME/.config/ranger"
    fi

    cp -f "$repo_path/ranger/command_full.py" "$HOME/.config/ranger/commands_full.py"
    cp -f "$repo_path/ranger/command.py"      "$HOME/.config/ranger/commands.py"
    cp -f "$repo_path/ranger/rc.conf"         "$HOME/.config/ranger/rc.conf"
    cp -f "$repo_path/ranger/rifle.conf"      "$HOME/.config/ranger/rifle.conf"
    cp -f "$repo_path/ranger/scope.sh"        "$HOME/.config/ranger/scope.sh"

    ret="$?"
    echo
    success "Successfully installed ranger configure file"
    debug
}

function install() {
    msg "\\033[1;34m==>\\033[0m Trying to install oh-my-dotfiles"

    if [ ! -z "$_all" ]; then
        install_for_i3
        install_for_vim
        install_for_git
        install_for_pip
        install_for_bash
        install_for_tmux
        install_for_ranger

        return
    fi

    if [ ! -z "$_i3" ]; then
        install_for_i3
    elif [ ! -z "$_vim" ]; then
        install_for_vim
    elif [ ! -z "$_git" ]; then
        install_for_git
    elif [ ! -z "$_pip" ]; then
        install_for_pip
    elif [ ! -z "$_bash" ]; then
        install_for_bash
    elif [ ! -z "$_tmux" ]; then
        install_for_tmux
    elif [ ! -z "$_ranger" ]; then
        install_for_ranger
    fi
}

function help() {
cat << EOF
usage: $0 [OPTIONS]
    --help              Show this message
    --all               Install oh-my-dotfiles for [I3, Vim, Git, Pip, Bash, Tmux, Ranger]
    --i3                Install oh-my-dotfiles for I3
    --vim               Install oh-my-dotfiles for Vim
    --git               Install oh-my-dotfiles for Git
    --pip               Install oh-my-dotfiles for Pip
    --bash              Install oh-my-dotfiles for Bash
    --tmux              Install oh-my-dotfiles for Tmux
    --ranger            Install oh-my-dotfiles for Ranger
    --update            Update oh-my-dotfiles
EOF
}

function main() {
    local opt=$1
    case $opt in
        --help)
            help
            exit 0
            ;;
        --all)          _all=1      ;;
        --i3)           _i3=1       ;;
        --vim)          _vim=1      ;;
        --git)          _git=1      ;;
        --pip)          _pip=1      ;;
        --bash)         _bash=1     ;;
        --tmux)         _tmux=1     ;;
        --ranger)       _ranger=1   ;;
        --update)       _update=1   ;;
        *)
            echo "unknown option: $opt"
            help
            exit 1
            ;;
    esac

    # Set HOME environment variable
    variable_set "$HOME"

    # Check tools
    program_exists "curl"
    program_exists "make"
    program_exists "i3"
    program_exists "vim"
    program_exists "git"
    program_exists "pip"
    program_exists "bash"
    program_exists "tmux"
    program_exists "ranger"

    if [ _update == 1 ]; then
        # Repo Sync
        repo_sync
    else
        # Install
        install

        # Finish
        msg "\\nThanks for installing \\033[1;32m$app_name\\033[0m. Enjoy!"
        oh_my_dotfiles
    fi
}


# run main function
if [ $# == 1 ]; then
    main $1
else
    help
fi

# EOF

