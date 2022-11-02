-- Copyright (C) 2022. All rights reserved.
-- File name   : nvim-treesitter-proxy.lua
-- Version     : v1.0
-- Author      : codeMonkey
-- Date        : 2022-10-21
-- Description : nvim-treesitter parse configuration file


local list = require("nvim-treesitter.parsers").get_parser_configs()

list.meson = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-meson",
        branch = "master",
        files = { "src/parser.c" },
    },
    filetype = "meson",
    maintainers = { "@Decodetalkers" },
}

list.javascript = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-javascript",
        files = { "src/parser.c", "src/scanner.c" },
    },
    maintainers = { "@steelsojka" },
}

list.c = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-c",
        files = { "src/parser.c" },
    },
    maintainers = { "@vigoux" },
}

list.cpp = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-cpp",
        files = { "src/parser.c", "src/scanner.cc" },
        generate_requires_npm = true,
    },
    maintainers = { "@theHamsta" },
}

list.cuda = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-cuda",
        files = { "src/parser.c", "src/scanner.cc" },
        generate_requires_npm = true,
    },
    maintainers = { "@theHamsta" },
}

list.dockerfile = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-dockerfile",
        branch = "main",
        files = { "src/parser.c" },
    },
    maintainers = { "@camdencheek" },
}

list.lua = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-lua",
        branch = "main",
        files = { "src/parser.c", "src/scanner.c" },
    },
    maintainers = { "@muniftanjim" },
}

list.python = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-python",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    maintainers = { "@stsewd", "@theHamsta" },
}

list.go = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-go",
        files = { "src/parser.c" },
    },
    maintainers = { "@theHamsta", "@WinWisely268" },
}

list.bash = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-bash",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    filetype = "sh",
    maintainers = { "@TravonteD" },
}

list.java = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-java",
        files = { "src/parser.c" },
    },
    maintainers = { "@p00f" },
}

list.kotlin = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-kotlin",
        branch = "main",
        files = { "src/parser.c", "src/scanner.c" },
    },
    maintainers = { "@SalBakraa" },
}

list.html = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-html",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    maintainers = { "@TravonteD" },
}

list.json = {
    install_info = {
    url = "https://gitee.com/zhengqijun/tree-sitter-json",
    files = { "src/parser.c" },
},
    maintainers = { "@steelsojka" },
}

list.css = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-css",
        files = { "src/parser.c", "src/scanner.c" },
    },
    maintainers = { "@TravonteD" },
}

list.scss = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-scss",
        files = { "src/parser.c", "src/scanner.c" },
    },
    maintainers = { "@elianiva" },
}

list.todotxt = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-todotxt.git",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "todotxt",
    maintainers = { "@arnarg" },
    experimental = true,
}

list.typescript = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-typescript",
        files = { "src/parser.c", "src/scanner.c" },
        location = "typescript",
        generate_requires_npm = true,
    },
    maintainers = { "@steelsojka" },
}

list.tsx = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-typescript",
        files = { "src/parser.c", "src/scanner.c" },
        location = "tsx",
        generate_requires_npm = true,
    },
    filetype = "typescriptreact",
    maintainers = { "@steelsojka" },
}

list.markdown = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-markdown",
        location = "tree-sitter-markdown",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "split_parser",
        readme_name = "markdown (basic highlighting)",
    },
    maintainers = { "@MDeiml" },
    experimental = true,
}

list.markdown_inline = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-markdown",
        location = "tree-sitter-markdown-inline",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "split_parser",
        readme_name = "markdown_inline (needs to be installed for full markdown highlighting)",
    },
    maintainers = { "@MDeiml" },
    experimental = true,
}

list.jsonc = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-jsonc.git",
        files = { "src/parser.c" },
        generate_requires_npm = true,
    },
    readme_name = "JSON with comments",
    maintainers = { "@WhyNotHugo" },
}

list.yaml = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-yaml",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    maintainers = { "@stsewd" },
}

list.regex = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-regex",
        files = { "src/parser.c" },
    },
    maintainers = { "@theHamsta" },
}

list.comment = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-comment",
        files = { "src/parser.c", "src/scanner.c" },
    },
    maintainers = { "@stsewd" },
}

list.sql = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-sql",
        files = { "src/parser.c" },
    },
    maintainers = { "@derekstride" },
}

list.latex = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-latex",
        files = { "src/parser.c", "src/scanner.c" },
    },
    filetype = "tex",
    maintainers = { "@theHamsta, @clason" },
}

list.cmake = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-cmake",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    maintainers = { "@uyha" },
}

list.vim = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-viml",
        files = { "src/parser.c", "src/scanner.c" },
    },
    filetype = "vim",
    maintainers = { "@vigoux" },
}

list.help = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-vimdoc",
        files = { "src/parser.c" },
    },
    filetype = "help",
    maintainers = { "@vigoux" },
}

list.json5 = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-json5",
        files = { "src/parser.c" },
    },
    filetype = "json5",
    maintainers = { "@Joakker" },
}

list.llvm = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-llvm",
        branch = "main",
        files = { "src/parser.c" },
    },
    maintainers = { "@benwilliamgraham" },
}

list.http = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-http",
        branch = "main",
        files = { "src/parser.c" },
        generate_requires_npm = true,
    },
    maintainers = { "@NTBBloodbath" },
}

list.prisma = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-prisma",
        branch = "master",
        files = { "src/parser.c" },
    },
    maintainers = { "@elianiva" },
}

list.make = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-make",
        branch = "main",
        files = { "src/parser.c" },
    },
    maintainers = { "@lewis6991" },
}

list.proto = {
    install_info = {
        url = "https://gitee.com/zhengqijun/tree-sitter-proto",
        branch = "main",
        files = { "src/parser.c" },
    },
    maintainers = { "@fsouza" },
    filetype = "proto",
}

-- EOF

