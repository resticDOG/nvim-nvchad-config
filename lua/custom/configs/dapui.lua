local present, dapui = pcall(require, "dapui")
local dap_python = require "dap-python"
local mason_dap = require "mason-nvim-dap"

if not present then
  return
end

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
local debugpy_path = mason_path .. "packages/debugpy/venv/Scripts/python"

dap_python.setup(debugpy_path)
mason_dap.setup {
  ensure_installed = { "python" },
}

dapui.setup {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25,
        },
        {
          id = "breakpoints",
          size = 0.25,
        },
        {
          id = "stacks",
          size = 0.25,
        },
        {
          id = "watches",
          size = 0.25,
        },
      },
      position = "left",
      size = 20,
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.2,
        },
        {
          id = "console",
          size = 0.8,
        },
      },
      position = "bottom",
      size = 15,
    },
  },
}
