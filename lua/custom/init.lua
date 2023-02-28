-- global settings

vim.opt.linespace = 1000
-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""

local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- auto format on save
-- autocmd("BufWritePre", {
--   pattern = "*",
--   command = "lua vim.lsp.buf.format()",
-- })
