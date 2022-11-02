#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : git.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : git bash


function review_code() {
    local tmp=`git branch | grep "*"`
    tmp="${tmp#* }"
    local remote_name=`git remote`
    git push $remote_name HEAD:refs/for/$tmp
}

function git_colc_user_code() {
    git log --author="${1}" --pretty=tformat: --numstat | awk '{ \
        add += $1; subs += $2; loc += $1 - $2 } END { \
        printf "added lines: %s, removed lines: %s, total lines: %s\n", \
        add, subs, loc }' -
}

function git_colc_all_code() {
    git log --format='%aN' | sort -u | while read name; do
        echo -en "$name\t";
        git log --author="$name" --pretty=tformat: --numstat | awk '{ \
            add += $1; subs += $2; loc += $1 - $2 } END { \
            printf "added lines: %s, removed lines: %s, total lines: %s\n", \
            add, subs, loc }' -;
    done
}

# Match `git --version` !!!
#   - https://raw.githubusercontent.com/git/git/v2.17.1/contrib/completion/git-completion.bash
# git completion
git_version=`git --version | awk -F" " '{print $3}'`
if [[ "$git_version" == "2.17.1" && -f $OMB_HOME/plugins/git/git-completion.bash ]]; then
    source $OMB_HOME/plugins/git/git-completion.bash
elif [[ -f $OMB_HOME/plugins/git/git-completion-$git_version.bash ]]; then
    source $OMB_HOME/plugins/git/git-completion-$git_version.bash
else
    # curl -o $OMB_HOME/plugins/git/git-completion-$git_version.bash https://raw.githubusercontent.com/git/git/v$git_version/contrib/completion/git-completion.bash
    curl -o $OMB_HOME/plugins/git/git-completion-$git_version.bash https://gitee.com/zhengqijun/git/raw/v$git_version/contrib/completion/git-completion.bash
    source $OMB_HOME/plugins/git/git-completion-$git_version.bash
fi
unset git_version

# Use starship instead of git-prompt !!!
# git prompt
# if [[ -f $OMB_HOME/plugins/git/git-prompt.sh ]]; then
#     source $OMB_HOME/plugins/git/git-prompt.sh
# fi

# EOF

