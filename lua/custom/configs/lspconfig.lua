local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require "lspconfig.util"
local is_windows = require("custom.utils").is_windows

local lspconfig = require "lspconfig"

-- Mason data path
local mason_registry = require "mason-registry"

local servers = {
  "html",
  "cssls",
  "clangd",
  "emmet_ls",
  "bashls",
  "pyright",
  "lemminx",
  "sqlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- tsserver support volar 2.0+
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = vue_language_server_path,
--         languages = { "vue" },
--       },
--     },
--   },
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
-- }

-- volar take over mode
local function get_typescript_server_path(root_dir)
  -- use nvm-windows environment on windows
  local get_global_ts_lib_path = function()
    if is_windows() then
      return os.getenv "NVM_SYMLINK" .. "/node_modules/typescript/lib"
    end
    return os.getenv "NVM_BIN" .. "/../lib/node_modules/typescript/lib"
  end
  -- Alternative location if installed as root:
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
    return get_global_ts_lib_path()
  end
end

-- volar
lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
}

-- powershell_es
lspconfig.powershell_es.setup {
  bundle_path = mason_registry.get_package("powershell-editor-services"):get_install_path(),
}
