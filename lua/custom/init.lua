local opt = vim.opt
opt.clipboard = "unnamedplus"
if vim.fn.has "wsl" then
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
    callback = function()
      vim.fn.system("clip.exe", vim.fn.getreg '"')
    end,
  })
end
