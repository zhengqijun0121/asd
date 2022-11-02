# Copyright (C) 2022. All rights reserved.
# File name   : Makefile
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2022-01-21
# Description : neofetch install script

CONFIG      := $(HOME)/.config
NEOFETCH    := $(HOME)/.config/neofetch
APP         := neofetch

help:
	@echo "usage: make [OPTIONS]"
	@echo "    help        Show this message"
	@echo "    neofetch    Install neofetch for Vim"
	@echo "    uninstall   Uninstall neofetch"

neofetch:
	@echo "\033[1;34m==>\033[0m Trying to install \033[1;32m$(APP)\033[0m"; \
	[ ! -d $(CONFIG) ] && mkdir -p $(CONFIG) && echo "    - Created $(CONFIG)"; \
	ln -s ~/.oh-my-dotfiles/neofetch $(NEOFETCH); \
	echo "\n\033[1;32m[✔]\033[0mSuccessfully installed \033[1;32m$(APP)\033[0m!"; \
	echo "\nThanks for installing \033[1;32m$(APP)\033[0m. Enjoy!\n"

uninstall:
	@echo "\033[1;34m==>\033[0m Trying to uninstall \033[1;32m$(APP)\033[0m"; \
	rm -rf  $(NEOFETCH)        && echo "    - Removed $(NEOFETCH)"; \
	echo "\n\033[1;32m[✔]\033[0m Successfully uninstalled \033[1;32m$(APP)\033[0m\n"

.PHONY: help neofetch uninstall

