# Copyright (C) 2019. All rights reserved.
# File name   : Dockerfile
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2019-12-10
# Description : Oh-My-Docker


# Pull base image.
FROM ubuntu:latest

# Author
MAINTAINER codeMonkey

# set shell
ENV SHELL=/bin/bash

# update sources list
ADD sources.list /etc/apt/sources.list

# equipment
RUN apt-get update && \
    apt-get install -y --no-install-recommends --allow-downgrades --fix-missing \
    apt-utils \
    git-core \
    build-essential \
    zip \
    unzip \
    liblz4-tool \
    curl \
    wget \
    make \
    cmake \
    gcc \
    g++ \
    clang-6.0 \
    net-tools \
    htop \
    lib32ncurses5-dev \
    libx11-dev \
    vim-gtk3 \
    ssh \
    bc \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    ca-certificates \
    uuid \
    uuid-dev \
    lsof \
    openssh-client \
    openssh-server \
    less \
    language-pack-zh-hans \
    language-pack-en \
    tmux

# equipment python packages
RUN pip install --upgrade pip
RUN pip install \
    wheel \
    pyyaml \
    pandas \
    numpy

# install & config git
RUN add-apt-repository -y ppa:git-core/ppa && \
    apt-get update -y && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/* && \
    git config --global ssh.variant ssh && \
    git config --global user.email "389214993@qq.com" && \
    git config --global user.name "codeMonkey"

# install ccache
# ADD https://www.samba.org/ftp/ccache/ccache-3.5.tar.gz /
# WORKDIR /
# RUN tar zxf ccache-3.5.tar.gz
# WORKDIR /ccache-3.5
# RUN ./configure && make && make install && rm -r /ccache-3.5*

# install repo
# ADD repo /usr/bin

# set user
ENV HOME /home/zhengqijun
RUN groupadd -g 10000 zhengqijun
RUN useradd -c "zhengqijun user" -d $HOME -u 10000 -g 10000 -m zhengqijun
USER zhengqijun:zhengqijun
WORKDIR /home/zhengqijun

# expose ports.
# EXPOSE 5000

# EOF

