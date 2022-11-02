#!/usr/bin/env bash

# Copyright (C) 2019. All rights reserved.
# File name   : docker.bash
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-09-24
# Description : docker bash


iauto_image="iregistry.iauto.com/ci_members/iautoandroid-container/common/fullenv:latest"

alias docker_newgrp="newgrp docker"

alias docker_pull_iauto="docker pull $iauto_image"

alias docker_run_iauto="docker run -it --tmpfs /tmp:exec --entrypoint /bin/bash --rm -w $HOME \
    -v $HOME:$HOME -e HOME=$HOME -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group \
    --device /dev/kvm -e DISPLAY=${DISPLAY} -e USER=$(whoami) -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /usr/share/bash-completion:/usr/share/bash-completion -u $(id -u ${USER}):$(id -g ${USER}) \
    --dns=192.168.2.14 --device /dev/fuse --ulimit nofile=40960 --privileged $iauto_image"

unset iauto_image

# EOF

