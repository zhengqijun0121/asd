#!/usr/bin/env bash

# Copyright (C) 2020. All rights reserved.
# File name   : fzf.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2020-04-27
# Description : fzf bash


# Add fzf plugin
if [[ -f ~/.fzf.bash ]]; then
    source ~/.fzf.bash
fi

unalias cdg 2> /dev/null

# fzfp
alias fzfp='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'"'"

sys_cdg_paths=/etc/cdg_paths
user_cdg_paths=~/.cdg_paths

function cdscuts_list_echo() {
    cat $1 | sed '/^\s*$/d'
}

function cdscuts_glob_echo() {
    system_wide_filelist=''
    user_filelist=''

    if [[ -r $sys_cdg_paths ]]; then
       system_wide_filelist=$(cdscuts_list_echo $sys_cdg_paths)
    fi

    if [[ -r $user_cdg_paths ]]; then
       user_filelist=$(cdscuts_list_echo $user_cdg_paths)
    fi

    echo -e "$system_wide_filelist\n$user_filelist" | sed '/^\s*$/d'
}

function cdg_add() {
    local curr_dir=${PWD}

    if [[ ! -e $user_cdg_paths ]]; then
        cdg_clear
    fi

    if ! grep -Fxq "$curr_dir" $user_cdg_paths; then
        echo "$curr_dir" >> $user_cdg_paths
    fi
}

function cdg_del() {
    local del_dir=$(cdscuts_glob_echo | fzf-tmux)
    del_dir=${del_dir//\//\\/}
    sed -i -e "/^$del_dir$/d" $user_cdg_paths
}

function cdg_clear() {
    cat /dev/null > $user_cdg_paths
}

function cdg_list() {
    if [[ -e $user_cdg_paths ]]; then
        cat $user_cdg_paths
    fi
}

# cdg - cd bookmarks
function cdg() {
   local dest_dir=$(cdscuts_glob_echo | fzf-tmux)

   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}

# fd - cd to selected directory
function fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

# fda - including hidden directories
function fda() {
    local dir
    dir=$(find ${1:-.} -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

function get_parent_dirs() {
    if [[ -d "${1}" ]]; then
        dirs+=("$1")
    else
        return
    fi

    if [[ "${1}" == '/' ]]; then
        for _dir in "${dirs[@]}"; do
            echo $_dir
        done
    else
        get_parent_dirs $(dirname "$1")
    fi
}

# fdr - cd to selected parent directory
function fdr() {
    local declare dirs=()
    local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
    cd "$DIR"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
function cf() {
    local file

    file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

    if [[ -n $file ]]; then
        if [[ -d $file ]]; then
            cd -- $file
        else
            cd -- ${file:h}
        fi
    fi
}

# cdf - cd into the directory of the selected file
function cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fkill - kill process
function fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [[ "x$pid" != "x" ]]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

# fbr - checkout git branch
function fbr() {
    local branches branch
    branches=$(git --no-pager branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fco - checkout git branch/tag
function fco() {
    local tags branches target
    branches=$(
        git --no-pager branch --all \
            --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
        | sed '/^$/d') || return
    tags=$(
        git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
    target=$(
        (echo "$branches"; echo "$tags") |
        fzf --no-hscroll --no-multi -n 2 \
            --ansi) || return
    git checkout $(awk '{print $2}' <<<"$target" )
}

# fco_preview - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
function fco_preview() {
    local tags branches target
    branches=$(
        git --no-pager branch --all \
        --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
        | sed '/^$/d') || return
    tags=$(
        git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
    target=$(
        (echo "$branches"; echo "$tags") |
        fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
    git checkout $(awk '{print $2}' <<<"$target" )
}

# fcoc - checkout git commit
function fcoc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow - git commit browser
function fshow() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
function fcs() {
    local commits commit
    commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
    echo -n $(echo "$commit" | sed "s/ .*//")
}

export -f cdg > /dev/null

# EOF

