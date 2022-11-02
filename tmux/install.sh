#!/usr/bin/env bash
# Copyright (C) 2022. All rights reserved.
# File name   : install.sh
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2022-01-21
# Description : tmux install script


git clone https://gitee.com/zhengqijun/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf
cp tmux.conf.local ~/.tmux.conf.local

# EOF

