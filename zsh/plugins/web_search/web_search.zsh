#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : web_search.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : web search


function web_search() {
    # define search engine urls
    declare -A urls
    local urls=(
        [google]="https://www.google.com/search?q="
        [bing]="https://www.bing.com/search?q="
        [yahoo]="https://search.yahoo.com/search?p="
        [duckduckgo]="https://www.duckduckgo.com/?q="
        [startpage]="https://www.startpage.com/do/search?q="
        [yandex]="https://yandex.ru/yandsearch?text="
        [github]="https://github.com/search?q="
        [baidu]="https://www.baidu.com/s?wd="
        [ecosia]="https://www.ecosia.org/search?q="
        [goodreads]="https://www.goodreads.com/search?q="
        [qwant]="https://www.qwant.com/?q="
        [givero]="https://www.givero.com/search?q="
        [stackoverflow]="https://stackoverflow.com/search?q="
    )

    # check whether the search engine is supported
    if [[ -z ${urls[$1]} ]]; then
        echo "Search engine $1 not supported."
        return 1
    fi

    # search or go to main page depending on number of arguments passed
    if [[ $# -gt 1 ]]; then
        # build search url:
        # join arguments passed with '+', then append to search engine URL
        local url=${urls[$1]}$2
    else
        # build main page url:
        # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
        local url=${urls[$1]%/*}
    fi

    xdg-open "$url"
}


alias bing='web_search bing'
alias google='web_search google'
alias yahoo='web_search yahoo'
alias ddg='web_search duckduckgo'
alias sp='web_search startpage'
alias yandex='web_search yandex'
alias github='web_search github'
alias baidu='web_search baidu'
alias ecosia='web_search ecosia'
alias goodreads='web_search goodreads'
alias qwant='web_search qwant'
alias givero='web_search givero'
alias stackoverflow='web_search stackoverflow'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'

# EOF

