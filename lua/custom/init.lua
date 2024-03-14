local opt = vim.opt

local function is_wsl()
  local output = vim.fn.systemlist("uname -r")
  local result = false

  for _, line in ipairs(output) do
    if line:find("microsoft", 1, true) then
      result = true
      break
    end
  end

  return result
end

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
