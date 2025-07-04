local is_windows = require("custom.utils").is_windows
local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "luadoc",
    "html",
    "css",
    "scss",
    "javascript",
    "jsdoc",
    "c",
    "java",
    "gitcommit",
    "yaml",
    "json",
    "vue",
    "sql",
    "markdown",
    "markdown_inline",
    "python",
    "comment",
  },
  comment = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- clangd
    "clangd",
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "vue-language-server",
    "prettierd",
    "eslint_d",
    "emmet-ls",

    -- java
    "jdtls",
    "java-debug-adapter",
    "java-test",

    -- bash stuff
    "bash-language-server",

    -- python stuff
    "pyright",
    "debugpy",
    "flake8",
    "black",

    -- xml
    "lemminx",
    "xmlformatter",

    -- powershell
    "powershell-editor-services",

    -- sql
    "sqlls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    width = 50,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

-- Use nushell for shell on windows
M.nvterm = {
  terminals = {
    shell = is_windows() and "nu",
  },
}

return M
