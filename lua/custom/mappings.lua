---@type MappingsConfig
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<C-z>"] = { "u", "Un do", opts = { nowait = true } },
    ["<C-q>"] = { "<C-v>", "Multiple line select", opts = { nowait = true } },
    ["qq"] = { ":qa!<CR>", "Force quit without save", opts = { nowait = true } },
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
      "Show method description",
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
    ["<leader>o"] = {
      function()
        require("jdtls").organize_imports()
      end,
      "organize imports",
    },
    ["<leader> tc"] = {
      function()
        require("jdtls").test_class()
      end,
      "Test class",
    },
    ["<leader>tn"] = {
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
    ["<leader>d"] = {
      function()
        require("dap").continue()
      end,
      "dap continue",
    },
    ["<leader>fl"] = {
      function()
        -- float console
        require("dapui").float_element("console", { width = 150, height = 30, position = "center", enter = true })
      end,
      "Dap float console",
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
    ["<M-o>"] = {
      function()
        require("dapui").toggle()
      end,
      "Dap ui open",
    },
  },
}

-- hop
M.hop = {
  n = {
    ["q"] = { "<cmd>HopChar1<cr>", "find in buffer" },
    ["f"] = { "<cmd>HopChar1CurrentLine<cr>", "find in current line" },
  },
  v = {
    ["q"] = { "<cmd>HopChar1<cr>", "find in buffer" },
    ["f"] = { "<cmd>HopChar1CurrentLine<cr>", "find in current line" },
  },
}

-- fugitive
M.git = {
  n = {
    ["<leader>gb"] = { "<cmd>Gitsigns blame_line<cr>", "Git blame" },
    ["<leader>gd"] = { "<cmd>Git diff<cr>", "Git diff" },
    ["<leader>gl"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Git toggle current line blame" },
    ["<leader>gn"] = { "<cmd>Neogit<cr>", "Neogit" },
  },
}

-- trouble
M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "TroubleToggle workspace_diagnostics" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "TroubleToggle document_diagnostics" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "TroubleToggle quickfix" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", "TroubleToggle loclist" },
    ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "TroubleToggle lsp_references" },
  },
}

return M
