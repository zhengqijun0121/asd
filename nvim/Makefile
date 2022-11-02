# Copyright (C) 2022. All rights reserved.
# File name   : Makefile
# Version     : v1.0
# Author      : codeMonkey
# Date        : 2022-01-01
# Description : my-vimrc install script

VIMRC          := $(HOME)/.vimrc
NVIMRC         := $(HOME)/.config/nvim/init.vim
NVIM           := $(HOME)/.config/nvim
VIM            := $(HOME)/.vim
VIM_CONFIG     := $(HOME)/.vim/config
VIM_FILES      := $(HOME)/.vim/files
VIM_BACKUP     := $(HOME)/.vim/files/backup
VIM_UNDODIR    := $(HOME)/.vim/files/undodir
VIM_VIMWIKI    := $(HOME)/.vim/files/vimwiki

APP            := my-vimrc
MYVIMRC_INIT   := $(HOME)/.myvimrc/vimrc
MYVIMRC_CONFIG := $(HOME)/.myvimrc/config
MYVIMRC_FILES  := $(HOME)/.myvimrc/files
DOT_MYVIMRC    := $(HOME)/.myvimrc

help:
	@echo "usage: make [OPTIONS]"
	@echo "    help        Show this message"
	@echo "    vim         Install my-vimrc for Vim"
	@echo "    neovim      Install my-vimrc for NeoVim"
	@echo "    update      Update my-vimrc"
	@echo "    uninstall   Uninstall my-vimrc"

vim:
	@echo "\033[1;34m==>\033[0m Trying to install \033[1;32m$(APP)\033[0m for Vim"; \
	[ ! -f $(VIM) ]         && mkdir -p $(VIM)                  && echo "    - Created $(VIM)"; \
	[ ! -f $(VIMRC) ]       && cp -rf $(MYVIMRC_INIT) $(VIMRC)  && echo "    - Created $(VIMRC)"; \
	[ ! -f $(DOT_MYVIMRC) ] && cp -rf $(MYVIMRC_CONFIG) $(VIM)  && echo "    - Created $(VIM_CONFIG)"; \
	[ ! -f $(DOT_MYVIMRC) ] && cp -rf $(MYVIMRC_FILES) $(VIM)   && echo "    - Created $(VIM_FILES)"; \
	[ ! -d $(VIM_BACKUP) ]  && mkdir -p $(VIM_BACKUP)           && echo "    - Created $(VIM_BACKUP)"; \
	[ ! -d $(VIM_UNDODIR) ] && mkdir -p $(VIM_UNDODIR)          && echo "    - Created $(VIM_UNDODIR)"; \
	[ ! -d $(VIM_VIMWIKI) ] && mkdir -p $(VIM_VIMWIKI)          && echo "    - Created $(VIM_VIMWIKI)"; \
	vim  +'PlugInstall' +qall; \
	echo "\n\033[1;32m[✔]\033[0mSuccessfully installed \033[1;32m$(APP)\033[0m for Vim!"; \
	echo "\nThanks for installing \033[1;32m$(APP)\033[0m. Enjoy!\n"

neovim:
	@echo "\033[1;34m==>\033[0m Trying to install \033[1;32m$(APP)\033[0m for NeoVim"; \
	[ ! -f $(NVIM) ]        && mkdir -p $(NVIM)                 && echo "    - Created $(NVIM)"; \
	[ ! -f $(VIM) ]         && mkdir -p $(VIM)                  && echo "    - Created $(VIM)"; \
	[ ! -f $(NVIMRC) ]      && cp -rf $(MYVIMRC_INIT) $(NVIMRC) && echo "    - Created $(NVIMRC)"; \
	[ ! -f $(DOT_MYVIMRC) ] && cp -rf $(MYVIMRC_CONFIG) $(VIM)  && echo "    - Created $(VIM_CONFIG)"; \
	[ ! -f $(DOT_MYVIMRC) ] && cp -rf $(MYVIMRC_FILES) $(VIM)   && echo "    - Created $(VIM_FILES)"; \
	[ ! -d $(VIM_BACKUP) ]  && mkdir -p $(VIM_BACKUP)           && echo "    - Created $(VIM_BACKUP)"; \
	[ ! -d $(VIM_UNDODIR) ] && mkdir -p $(VIM_UNDODIR)          && echo "    - Created $(VIM_UNDODIR)"; \
	[ ! -d $(VIM_VIMWIKI) ] && mkdir -p $(VIM_VIMWIKI)          && echo "    - Created $(VIM_VIMWIKI)"; \
	nvim +'PlugInstall' +qall; \
	echo "\n\033[1;32m[✔]\033[0mSuccessfully installed \033[1;32m$(APP)\033[0m for NeoVim!"; \
	echo "\nThanks for installing \033[1;32m$(APP)\033[0m. Enjoy!\n"

update:
	@echo "\033[1;34m==>\033[0m Trying to update \033[1;32m$(APP)\033[0m"; \
	git pull origin master; \
	echo "\n\033[1;32m[✔]\033[0m Successfully updated \033[1;32m$(APP)\033[0m\n"

uninstall:
	@echo "\033[1;34m==>\033[0m Trying to uninstall \033[1;32m$(APP)\033[0m"; \
	rm -rf  $(VIMRC)        && echo "    - Removed $(VIMRC)"; \
	rm -rf  $(VIM)          && echo "    - Removed $(VIM)"; \
	rm -rf  $(NVIM)         && echo "    - Removed $(NVIM)"; \
	rm -rf  $(DOT_MYVIMRC)  && echo "    - Removed $(DOT_MYVIMRC)"; \
	echo "\n\033[1;32m[✔]\033[0m Successfully uninstalled \033[1;32m$(APP)\033[0m\n"

.PHONY: help vim neovim update uninstall

