#!/usr/bin/env bash

# Copyright (C) 2021. All rights reserved.
# File name   : bash.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2021-12-23
# Description : bash completion


bash_completion_option=0

# Use bash-completion, if available
if [[ "$(uname)" ==  "Darwin" ]]; then  # Mac
    # Check for interactive bash and that we haven't already been sourced.
    [ -z "$BASH_VERSION" -o -z "$PS1" -o -n "$BASH_COMPLETION" ] && return

    # Check for recent enough version of bash.
    bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
    if [ $bmajor -gt 3 ] || [ $bmajor -eq 3 -a $bminor -ge 2 ]; then
        # 3.2.57(1)-release
        if shopt -q progcomp && [ -r /opt/homebrew/Cellar/bash-completion/1.3_3/etc/bash_completion ]; then
            # Source completion code.
            source /opt/homebrew/Cellar/bash-completion/1.3_3/etc/bash_completion
            bash_completion_option=1
        else
            echo "Please install bash_completion! brew install bash-completion"
        fi
    else
        # https://github.com/scop/bash-completion
        source $OMB_HOME/plugins/completion/bash_completion
        bash_completion_option=2
    fi
    unset bash bmajor bminor
else
    bash_completion_option=2
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        # Source completion code.
        source /usr/share/bash-completion/bash_completion
    else
        # https://github.com/scop/bash-completion
        source $OMB_HOME/plugins/completion/bash_completion
    fi
fi

if [[ $bash_completion_option == 2 ]]; then
    # completion-alias
    # https://github.com/cykerway/complete-alias
    if [[ -f $OMB_HOME/plugins/completion/complete_alias.bash ]]; then
        source $OMB_HOME/plugins/completion/complete_alias.bash

        # alias command completion
        # bug: error: cannot unmask alias command: ls
        #   -> alias ls='ls --color=auto'
        # complete -F _complete_alias "${!BASH_ALIASES[@]}"
        for bash_aliase in ${!BASH_ALIASES[@]}; do
            if [[ "$bash_aliase" != "ls" ]]; then
                complete -F _complete_alias "$bash_aliase"
            fi
        done
        unset bash_aliase

        # sudo completion
        complete -r sudo
    fi

    # completion-tmux
    if [[ -f $OMB_HOME/plugins/completion/tmux.bash ]]; then
        source $OMB_HOME/plugins/completion/tmux.bash
    fi

    # completion-partial-path
    if [[ -f $OMB_HOME/plugins/completion/partial_path.bash ]]; then
        source $OMB_HOME/plugins/completion/partial_path.bash
        _bcpp --defaults
    fi
fi

# EOF

