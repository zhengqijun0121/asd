## clangd

### Configure clangd

1. `compile_file.txt`

```bash
cp compile_file.txt ~
```

2. `config.yaml`

[https://clangd.llvm.org/config](https://clangd.llvm.org/config)

user configuration: a config.yaml file in an OS-specific directory:

- Windows: %LocalAppData%\clangd\config.yaml, typically C:\Users\Bob\AppData\Local\clangd\config.yaml.
- macOS: ~/Library/Preferences/clangd/config.yaml
- Linux and others: $XDG_CONFIG_HOME/clangd/config.yaml, typically ~/.config/clangd/config.yaml.

for example:

```yaml
CompileFlags:                     # Tweak the parse settings
  Add: [-xc++, -Wall]             # treat all files as C++, enable more warnings
  Remove: -W*                     # strip all other warning-related flags
  Compiler: clang++               # Change argv[0] of compile flags to `clang++`
```

