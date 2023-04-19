local opt = vim.opt
opt.clipboard = "unnamedplus"

-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   command = "NvimTreeOpen",
-- })
--

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 20
