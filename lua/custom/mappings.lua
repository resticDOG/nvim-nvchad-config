---@type MappingsConfig
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<c-z>"] = { "u", "un do", opts = { nowait = true } },
    ["qq"] = { ":qa!<CR>", "force quit without save", opts = { nowait = true } },
  },
}

M.jdtls = {
  n = {
    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "Go to definition",
    },
    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "Go to implementation",
    },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "Show method",
    },
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code action",
    },
    ["gr"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "Code rename",
    },
    ["gf"] = {
      function()
        vim.lsp.buf.references()
      end,
      "Code references",
    },
  },
}

-- nvim-dap
M.dap = {
  n = {
    ["<leader>bb"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "toggle breakpoint",
    },
    ["<leader>bc"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint")
      end,
      "Set breakpoint",
    },
    ["<leader>st"] = {
      function()
        require("dap").continue()
      end,
      "Dap continue",
    },
    ["<leader>so"] = {
      function()
        require("dap").step_over()
      end,
      "Dap Step over",
    },
    ["<leader>si"] = {
      function()
        require("dap").step_into()
      end,
      "Dap step into",
    },
  },
}
-- dap ui
M.dapui = {
  n = {
    ["<leader>do"] = {
      function()
        require("dapui").open()
      end,
      "Dap ui open",
    },
    ["<leader>dc"] = {
      function()
        require("dapui").close()
      end,
      "Dap ui close",
    },
  },
}

-- hop
M.hop = {
  n = {
    ["f"] = { "<cmd>HopChar1CurrentLine<cr>", "find in current line" },
    ["q"] = { "<cmd>HopChar1<cr>", "find in buffer" },
  },
  v = {
    ["f"] = { "<cmd>HopChar1CurrentLine<cr>", "find in current line" },
    ["q"] = { "<cmd>HopChar1<cr>", "find in buffer" },
  },
}

-- code action preview
M.codepreview = {
  n = {
    ["<leader>ap"] = {
      function()
        require("actions-preview").code_actions()
      end,
      "code actions preview",
    },
  },
  v = {
    ["<leader>ap"] = {
      function()
        require("actions-preview").code_actions()
      end,
      "code actions preview",
    },
  },
}

return M
