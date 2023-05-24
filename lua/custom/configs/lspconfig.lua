local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "emmet_ls",
  "bashls",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- volar take over mode
lspconfig.volar.setup {
  init_options = {
    typescript = {
      tsdk = "/home/linkzz/.nvm/versions/node/v18.14.0/lib/node_modules/typescript/lib",
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
}
