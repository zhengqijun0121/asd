# my-vimrc
vimrc

## Install

**one-line installer**

```shell
$ bash <(curl -fsSL https://raw.githubusercontent.com/codeMonkeyss/my-vimrc/master/install.sh?token=AFTZ32OQBUQWQGMPHRKTFN25MXURQ)
$ bash install.sh --update  # download my-vimrc
$ bash install.sh --vim     # install my-vimrc for vim
$ bash install.sh --neovim  # install my-vimrc for neovim
```

**Makefile**

```shell
$ git clone https://github.com/codeMonkeyss/my-vimrc.git ~/.myvimrc
$ cd ~/.myvimrc
$ make vim     # install my-vimrc for Vim
$ make neovim  # install my-vimrc for NeoVim
```

## Directory Structure
```tree
HOME/
├── .vim/
│   ├── autoload/
│   │   └── plug.vim
│   ├── config/
│   │   ├── config.vim
│   │   ├── filetype.vim
│   │   ├── init.vim
│   │   ├── main.vim
│   │   ├── mapping.vim
│   │   ├── plugin.vim
│   │   ├── terminal.vim
│   │   └── theme.vim
│   ├── files/
│   │   ├── backup/
│   │   ├── undodir/
│   │   ├── vimwiki/
│   │   └── ycm/
│   │       └── .ycm.extra.conf.py
│   └── plugged/
│       └── xxx.vim
└── .vimrc
```

## 修改~/.vimrc

```bash
ln -s ~/.oh-my-dotfiles/vim/vimrc ~/.vimrc
```


