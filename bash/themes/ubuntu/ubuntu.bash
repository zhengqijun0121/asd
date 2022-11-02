#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : ubuntu.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-17
# Description : ubuntu prompt


# color & base theme
if [[ -f $OMB_HOME/themes/color.bash ]]; then
    source $OMB_HOME/themes/color.bash
fi

if [[ -f $OMB_HOME/themes/base.bash ]]; then
    source $OMB_HOME/themes/base.bash
fi

function setup_left_and_right {
    # Your customizations go here. The idea is to export $PS1_LEFT and $PS1_RIGHT
    # as two strings, each formatted like $PS1 normally is. (That is, with \[\]
    # around escape sequences.)

    # Note that you can't use Bash-specific backslash sequences on the right; if
    # you do, this script won't know the proper length and your right prompt will
    # most likely run off the screen.

    get_user_style
    get_host_style

    # Set the terminal master prompt.
    PS1_LEFT="\[\033]0;\W\007\]"                                                        # working directory base name
    PS1_LEFT+="\[${userStyle}\]\u"                                                      # username
    PS1_LEFT+="\[${BGreen}\]@"                                                          # @
    PS1_LEFT+="\[${hostStyle}\]\h"                                                      # hostname
    PS1_LEFT+="\[${BWhite}\]:"                                                          # :
    PS1_LEFT+="\[${BBlue}\]\w"                                                          # working directory full path
    PS1_LEFT+="\[${BBlue}\]\$ \[${Color_Off}\]"                                         # `$` (and Color_Off color)

    export PS1_LEFT
}

# This is where we do all of the crazy sed trickery to figure out where to
# place the right prompt. Once we get it figured out it's actually easy to
# render; we just draw the right prompt first, then use \r to go all the way to
# the left, and draw the left prompt.
function set_ps1 {
    setup_left_and_right

    export PS1=$PS1_LEFT

    # Set the terminal multiline command prompt
    PS2="\[${BYellow}\]> \[${Color_Off}\]"
    export PS2
}

# NB: it's important that set_ps1 be the first thing in your PROMPT_COMMAND;
# otherwise you'll lose the status indicator for exit code.
PROMPT_COMMAND=set_ps1

# EOF

