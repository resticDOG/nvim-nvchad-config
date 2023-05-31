-- table size
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

local home = os.getenv "HOME"
local mason_dir = home .. "/.local/share/nvim/mason/packages"
local jdtls_dir = mason_dir .. "/jdtls"
local java_debug_dir = mason_dir .. "/java-debug-adapter"
local java_test_dir = mason_dir .. "/java-test"
local jdtls = require "jdtls"
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local remap = function(mode, rhs, lhs, bufopts, desc)
  if bufopts == nil then
    bufopts = {}
  end
  bufopts.desc = desc
  vim.keymap.set(mode, rhs, lhs, bufopts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  jdtls.setup_dap { hotcodereplace = "auto" }
  jdtls.setup.add_commands()

  -- Default keymaps
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  require("lsp.defaults").on_attach(client, bufnr)

  -- Java extensions
  remap("n", "<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  remap("n", "<leader>vc", jdtls.test_class, bufopts, "Test class (DAP)")
  remap("n", "<leader>vm", jdtls.test_nearest_method, bufopts, "Test method (DAP)")
  remap("n", "<leader>ev", jdtls.extract_variable, bufopts, "Extract variable")
  remap("n", "<leader>ec", jdtls.extract_constant, bufopts, "Extract constant")
  remap("v", "<leader>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], bufopts, "Extract method")
end

local bundles = {
  vim.fn.glob(java_debug_dir .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_dir .. "/extensions/server/*.jar"), "\n"))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local config = {
  flags = {
    debounce_text_changes = 80,
  },
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    bundles = bundles,
  },
  root_dir = root_dir,
  settings = {
    java = {
      format = {
        settings = {
          url = "/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk-amd64",
          },
        },
      },
    },
  },
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. jdtls_dir .. "/lombok.jar",
    "-jar",
    vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    jdtls_dir .. "/config_linux",
    "-data",
    workspace_folder,
  },
}

jdtls.start_or_attach(config)
