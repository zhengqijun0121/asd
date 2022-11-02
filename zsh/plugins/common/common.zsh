#!/usr/bin/env zsh

# Copyright (C) 2019. All rights reserved.
# File name   : common.zsh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-20
# Description : common zsh


function oh_my_dotfiles() {
    echo
    echo -e "[0;1;35;95m┏━[0;1;31;91m┓╻ [0;1;33;93m╻\t[0;1;32;92m┏[0;1;36;96m┳┓[0;1;35;95m╻ [0;1;31;91m╻\t[0;1;33;93m┳[0;1;32;92m━┓[0;1;36;96m┏━[0;1;34;94m┓[0;1;35;95m╺┳[0;1;31;91m╸[0;1;32;92m┏━[0;1;36;96m╸[0;1;34;94m╻ [0;1;35;95m╻ [0;1;31;91m ┏[0;1;33;93m━╸[0;1;32;92m┏━[0;1;36;96m┓ [0;1;34;94m[0m"
    echo -e "[0;1;31;91m┃ [0;1;33;93m┃┣━[0;1;32;92m┫\t[0;1;36;96m┃[0;1;34;94m┃┃[0;1;31;91m┗━[0;1;33;93m┫\t[0;1;32;92m┃[0;1;36;96m ┃[0;1;34;94m┃ [0;1;35;95m┃[0;1;31;91m ┃[0;1;36;96m [0;1;34;94m┣━[0;1;35;95m╸[0;1;31;91m┃ [0;1;33;93m┃ [0;1;32;92m ┣[0;1;36;96m━╸[0;1;34;94m┗━[0;1;35;95m┓ [0;1;31;91m[0m"
    echo -e "[0;1;33;93m┗━[0;1;32;92m┛╹ [0;1;36;96m╹\t[0;1;34;94m╹[0;1;35;95m ╹[0;1;33;93m┗━[0;1;32;92m┛\t[0;1;36;96m┻[0;1;34;94m━┛[0;1;35;95m┗━[0;1;31;91m┛[0;1;33;93m ╹[0;1;32;92m [0;1;34;94m╹ [0;1;35;95m [0;1;31;91m╹ [0;1;33;93m┗━[0;1;32;92m╸┗[0;1;36;96m━╸[0;1;34;94m┗━[0;1;35;95m┛ [0;1;31;91m[0m"
    echo
}

function trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

# shellcheck disable=SC2086,SC2048
function trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}

function lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}

function upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}

function trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}

function strip_all() {
    # Usage: strip_all "string" "pattern"
    printf '%s\n' "${1//$2}"
}

function strip() {
    # Usage: strip "string" "pattern"
    printf '%s\n' "${1/$2}"
}

function lstrip() {
    # Usage: lstrip "string" "pattern"
    printf '%s\n' "${1##$2}"
}

function rstrip() {
    # Usage: rstrip "string" "pattern"
    printf '%s\n' "${1%%$2}"
}

function urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}

function urldecode() {
    # Usage: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}

function reverse_array() {
    # Usage: reverse_array "array"
    shopt -s extdebug
    f()(printf '%s\n' "${ZSH_ARGV[@]}"); f "$@"
    shopt -u extdebug
}

function remove_array_dups() {
    # Usage: remove_array_dups "array"
    declare -A tmp_array

    for i in "$@"; do
        [[ $i ]] && IFS=" " tmp_array["${i:- }"]=1
    done

    printf '%s\n' "${!tmp_array[@]}"
}

function random_array_element() {
    # Usage: random_array_element "array"
    local arr=("$@")
    printf '%s\n' "${arr[RANDOM % $#]}"
}

function lines() {
    # Usage: lines "file"
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}

function lines_loop() {
    # Usage: lines_loop "file"
    count=0
    while IFS= read -r _; do
        ((count++))
    done < "$1"
    printf '%s\n' "$count"
}

function count() {
    # Usage: count /path/to/dir/*
    #        count /path/to/dir/*/
    printf '%s\n' "$#"
}

function dirname() {
    # Usage: dirname "path"
    dir=${1:-.}
    dir=${dir%%${dir##*[!/]}}

    [[ "${dir##*/*}" ]] && dir=.

    dir=${dir%/*}
    dir=${dir%%${dir##*[!/]}}

    printf '%s\n' "${dir:-/}"
}

function basename() {
    # Usage: basename "path" ["suffix"]
    local tmp

    tmp=${1%${1##*[!/]}}
    tmp=${tmp##*/}
    tmp=${tmp%"${2/$tmp}"}

    printf '%s\n' "${tmp:-/}"
}

function get_term_size() {
    # Usage: get_term_size

    # (:;:) is a micro sleep to ensure the variables are
    # exported immediately.
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}

function get_window_size() {
    # Usage: get_window_size
    printf '%b' "${TMUX:+\\ePtmux;\\e}\\e[14t${TMUX:+\\e\\\\}"
    IFS=';t' read -d t -t 0.05 -sra term_size
    printf '%s\n' "${term_size[1]}x${term_size[2]}"
}

function get_cursor_pos() {
    # Usage: get_cursor_pos
    IFS='[;' read -p $'\e[6n' -d R -rs _ y x _
    printf '%s\n' "$x $y"
}

# Create a new directory and enter it
function mkd() {
    # Usage: mkd dir
    mkdir -p "$@" && cd "$_"
}

# EOF

