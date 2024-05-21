local M = {}

M.is_windows = function()
  return vim.fn.has "win32" == 1 or vim.fn.has "win64" == 1
end

M.is_wsl = function()
  local output = vim.fn.systemlist "uname -r"
  local result = false

  for _, line in ipairs(output) do
    if line:find("microsoft", 1, true) then
      result = true
      break
    end
  end

  return result
end

return M
