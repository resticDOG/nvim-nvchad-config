-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
  ["@comment"] = {
    fg = "#579685",
    italic = true,
  },
  Visual = {
    -- bg = "#579685",
    -- underline = true,
    italic = true,
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
