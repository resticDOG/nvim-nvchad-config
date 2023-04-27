-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
  -- neotree
  Comment = {
    bold = true,
    fg = "gray",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  -- neotree
  NeoTreeDirectoryName = { fg = "blue" },
  NeoTreeDirectoryIcon = { fg = "blue" },
}

return M
