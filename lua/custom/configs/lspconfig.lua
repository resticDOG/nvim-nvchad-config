local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Mason data path
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "emmet_ls",
  "bashls",
  "pyright",
  "lemminx",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- volar take over mode
local util = require "lspconfig.util"
local function get_typescript_server_path(root_dir)
  local global_ts = os.getenv "NVM_BIN" .. "/../lib/node_modules/typescript/lib"
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ""
  local function check_dir(path)
    found_ts = util.path.join(path, "node_modules", "typescript", "lib")
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

-- volar
lspconfig.volar.setup {
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
}

-- powershell_es
lspconfig.powershell_es.setup {
  bundle_path = mason_path .. "packages/powershell-editor-services",
}
