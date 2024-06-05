local opt = vim.opt
local is_wsl = require("custom.utils").is_wsl

if is_wsl() then
  opt.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

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

-- 相对行号
opt.relativenumber = true
