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
        -- vim.lsp.buf.code_action()
        require("actions-preview").code_actions()
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
        -- vim.lsp.buf.references()
        -- use telescope instead
        require("telescope.builtin").lsp_references()
      end,
      "Code references",
    },
    ["fm"] = {
      function()
        vim.lsp.buf.format()
      end,
      "Code format",
    },
    ["<C>o"] = {
      function()
        require("jdtls").organize_imports()
      end,
      "organize imports",
    },
    ["<leader>vc"] = {
      function()
        require("jdtls").test_class()
      end,
      "Test class",
    },
    ["<leader>vm"] = {
      function()
        require("jdtls").test_nearest_method()
      end,
      "Test Method",
    },
    ["<leader>ev"] = {
      function()
        require("jdtls").extract_variable()
      end,
      "extract variable",
    },
    ["<leader>ec"] = {
      function()
        require("jdtls").extract_constant()
      end,
      "extract constant",
    },
    ["<leader>em"] = {
      function()
        require("jdtls").extract_method(true)
      end,
      "extract method",
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
    ["q"] = { "<cmd>HopChar1<cr>", "find in buffer" },
  },
  v = {
    ["q"] = { "<cmd>HopChar1<cr>", "find in buffer" },
  },
}

-- fugitive
M.fugitive = {
  n = {
    ["<leader>gb"] = { "<cmd>Git blame<cr>", "Git blame" },
    ["<leader>gd"] = { "<cmd>Git diff<cr>", "Git diff" },
  },
}

-- copilot

return M
