#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : base.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : base bash


# color
if [[ -f $OMB_HOME/themes/color.bash ]]; then
    source $OMB_HOME/themes/color.bash
fi

function prompt_git() {
    local s=''
    local branchName=''

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+='+'
            fi

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!'
            fi

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?'
            fi

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$'
            fi
        fi

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                      git rev-parse --short HEAD 2> /dev/null || \
                      echo '(unknown)')"

        [ -n "${s}" ] && s=" [${s}]"

        echo -e "${1}${branchName}${2}${s}"
    else
        return
    fi
}

function get_user_style() {
    # Highlight the user name when logged in as root.
    if [[ "${USER}" == "root" ]]; then
        userStyle="${BRed}"
    else
        userStyle="${BGreen}"
    fi
}

function get_host_style() {
    # Highlight the hostname when connected via SSH.
    if [[ "${SSH_TTY}" ]]; then
        hostStyle="${bold}${BRed}"
    else
        hostStyle="${BGreen}"
    fi
}

function get_exit_code() {
    local ret=$1

    if [[ $ret == 0 ]]; then
        echo -e "\[${BGreen}\][✔]"
    else
        echo -e "\[${BRed}\][$ret]"
    fi
}

# EOF

