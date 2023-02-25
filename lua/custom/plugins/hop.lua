local hop = require "hop"
hop.setup()

vim.keymap.set("", "f", "<cmd>HopChar1CurrentLine<cr>", { remap = true })
vim.keymap.set("", "q", "<cmd>HopChar1<cr>", { remap = true })
