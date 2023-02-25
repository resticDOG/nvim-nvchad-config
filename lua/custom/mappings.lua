---@type MappingsConfig
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.jdtls = {
  n = {
    ["gd"] = { function () vim.lsp.buf.definition() end, "Go to definition" },
    ["gi"] = { function () vim.lsp.buf.implementation() end, "Go to implementation" },
    ["K"] = { function () vim.lsp.buf.hover() end, "Show method" },
    ["<leader>ca"] = { function () vim.lsp.buf.code_action() end, "Code action" },
  }
}

M.dap = {
  n = {
    ["<leader>bb"] = { function () require("dap").toggle_breakpoint() end, "Set breakpoint" },
    ["<leader>bc"] = { function () require("dap").set_breakpoint(vim.fn.input('Breakpoint')) end, "Set breakpoint" },
  }
}

return M
