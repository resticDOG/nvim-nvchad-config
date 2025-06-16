-- table size
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

local home = os.getenv "HOME"
local JAVA_HOME = os.getenv "JAVA_HOME" .. ""
local JAVA_HOME_21 = string.gsub(JAVA_HOME, "(.*java).*(openjdk.*)", "%1-21-%2")
local JAVA_HOME_17 = string.gsub(JAVA_HOME, "(.*java).*(openjdk.*)", "%1-17-%2")
local JAVA_HOME_8 = string.gsub(JAVA_HOME, "(.*java).*(openjdk.*)", "%1-8-%2")
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
local jdtls_dir = mason_path .. "packages/jdtls"
local java_debug_dir = mason_path .. "packages/java-debug-adapter"
local java_test_dir = mason_path .. "packages/java-test"
local jdtls = require "jdtls"
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  jdtls.setup_dap { hotcodereplace = "auto" }
  jdtls.setup.add_commands()

  -- require("lsp.defaults").on_attach(client, bufnr)
end

local bundles = {
  vim.fn.glob(java_debug_dir .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_dir .. "/extension/server/*.jar", 1), "\n"))

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
          url = home .. "/.local/share/eclipse/eclipse-java-google-style.xml",
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
            name = "JavaSE-21",
            path = JAVA_HOME_21,
          },
          {
            name = "JavaSE-17",
            path = JAVA_HOME_17,
            default = true,
          },
          {
            name = "JavaSE-1.8",
            path = JAVA_HOME_8,
          },
        },
      },
    },
  },
  cmd = {
    JAVA_HOME_21 .. "/bin/java",
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
