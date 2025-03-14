-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
  ["@comment"] = {
    fg = "#579685",
  },
  Visual = {
    bg = "light_grey",
    underline = true,
  },
  Identifier = {
    fg = "white",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
