# dotfiles
Linux config file

## Install

**one-line installer**

```shell
$ bash <(curl -fsSL https://raw.githubusercontent.com/codeMonkeyss/my-bash/master/install.sh?token=AFTZ32OQBUQWQGMPHRKTFN25MXURQ)
$ bash install.sh --update  # download my-bash
$ bash install.sh --bash    # install my-bash for Bash
```

**Makefile**

```shell
$ git clone https://github.com/codeMonkeyss/my-bash.git ~/.mybash
$ cd ~/.mybash
$ make bash     # install my-bash for Bash
```

## Directory Structure
```tree
HOME/
├── .bash/
│   ├── aliases.bash
│   ├── exports.bash
│   ├── options.bash
│   ├── profile.bash
│   ├── prompt.bash
│   └── themes/
│       ├── base.bash
│       ├── color.bash
│       └── theme
│           └── theme.bash
└── .bashrc
```

