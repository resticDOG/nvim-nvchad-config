local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "luadoc",
    "html",
    "css",
    "javascript",
    "c",
    "java",
    "gitcommit",
    "yaml",
    "json",
    "vue",
    "sql",
  },
}

M.mason = {
  ensure_installed = {
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

    -- bash stuff
    "bash-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
