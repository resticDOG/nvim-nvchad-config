local opt = vim.opt
local g = vim.g

opt.clipboard = "unnamedplus"

-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   command = "NvimTreeOpen",
-- })
--

-- 折叠
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 20

-- 自动保存
opt.autowrite = true
opt.autowriteall = true
opt.updatetime = 300
