#!/usr/bin/env zsh

# Copyright (C) 2021. All rights reserved.
# File name   : aliases.zsh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2021-12-31
# Description : command aliases


# Allow aliases to be with sudo
alias sudo='sudo -E'

# Easier navigation: .., ..., ...., ~ and -
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias ~=' cd ~'
alias -- -=' cd -'

# List dir contents aliases
# ref: http://ss64.com/osx/ls.html
# Long form no user group, color
alias l='ls -oG'

# Order by last modified, long form no user group, color
alias lt='ls -toG'

# List all except . and ..., color, mark file types, long form no user group, file size
alias la='ls -AGFoh'

# List all except . and ..., color, mark file types, long form no use group, order by last modified, file size
alias lat='ls -AGFoth'
alias ll='ls -alF'

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls=' ls --color=auto'
    alias dir=' dir --color=auto'
    alias vdir=' vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # for mac
    export CLICOLOR='Yes'
    export LSCOLORS='ExGxFxdaCxDaDahbadacec'

    # export GREP_OPTIONS='--color=auto'
    # export FGREP_OPTIONS='--color=auto'
    # export EGREP_OPTIONS='--color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# source ~/.bashrc
alias zshrc=' source ~/.zshrc'

# history file update
alias historyw=' fc -IA'
alias historyr=' fc -IR'

# Concatenate and print content of files (add line numbers)
alias catn='cat -n'

# Copy my public key to the pasteboard
alias publickey="more ~/.ssh/id_rsa.pub | xclip | printf '=> Public key copied to pasteboard.\n'"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# IP
if command -v ip > /dev/null 2>&1; then
    alias myip="echo `ip route get 1 | awk '{print $(NF-2);exit}'`"
    # alias myip="echo `ip route get 1 | awk -F' ' '{print $7}'`"
    # alias myip="echo `ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p'`"
    # alias myip="echo `hostname -I | cut -d' ' -f1`"
    alias mac_address="echo `cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address`"
fi

# Vim & Neovim
# alias vi='vim'
alias nv='nvim'

# set astyle
alias astyle_cpp='astyle -A2 -z2 -s4 -f -n -p -c -H'
alias astyle_cpp_all='astyle_cpp $(find ./ -name "*.cpp" -o -name "*.h")'

# set cman alias
alias man='man -M /usr/share/man'
alias cman='man -M /usr/share/man/zh_CN'

# set sublime cmd
if command -v subl > /dev/null 2>&1; then
    alias subl='subl -a'
fi

# git
alias ga='git add'
alias ga.='git add .'
alias gb='git branch'
alias gcm='git commit'
alias gcma='git commit --amend'
alias gcmm='git commit -m'
alias gco='git checkout'
alias gco.='git checkout .'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gd.='git diff .'
alias gdc='git diff --cached'
alias gl='git log'
alias glg='git log --graph --oneline --decorate'
alias gp='git pull'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grh='git reset HEAD~'
alias grh.='git reset HEAD .'
alias grhh='git reset HEAD~ --hard'
alias gri='git rebase -i'
alias grv='git remote -v'
alias gs='git status'
alias gsh='git show'
alias gst='git stash'
alias gsta='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash delete'
alias gstl='git stash list'
alias gstpo='git stash pop'
alias gstpu='git stash push'
alias gsts='git stash save'

# quick move
alias dotfiles=' cd ~/.oh-my-dotfiles'
alias work=' cd ~/Workspace'
alias project=' cd ~/Project'
alias fonts=' cd ~/.oh-my-dotfiles/fonts'

# tree
alias treed='tree -d -L 3'

# gerrit
alias gerrit_push='curBranch=`git rev-parse --abbrev-ref HEAD`; git push origin ${curBranch}:refs/for/${curBranch}'

# ranger
alias ra='ranger'

# make
alias remake='make clean && make'

# tmux
alias tmuxn='tmux new-session -s'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

# EOF

