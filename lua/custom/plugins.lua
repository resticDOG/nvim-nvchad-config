local overrides = require "custom.configs.overrides"

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- code formatting, linting etc
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "phaazon/hop.nvim",
    cmd = { "HopChar1CurrentLine", "HopChar1" },
    config = function()
      require("hop").setup()
    end,
  },

  -- dap ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
      },
      {
        "mfussenegger/nvim-jdtls",
      },
    },
    config = function()
      require "custom.configs.dapui"
    end,
  },

  -- lsp progress ui
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup()
    end,
  },

  -- autotag
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    opts = {
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- telescope code action
  {
    "aznhe21/actions-preview.nvim",
    lazy = false,
    config = function()
      require("actions-preview").setup()
    end,
  },

  -- filetype nvim
  -- {
  --   "nathom/filetype.nvim",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.filetype"
  --   end,
  -- },

  -- neogit
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    config = function()
      require("neogit").setup {}
    end,
  },

  {
    "LhKipp/nvim-nu",
    event = "BufRead",
    config = function()
      require("nu").setup {}
    end,
  },

  -- trouble nvim
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "custom.configs.trouble"
    end,
  },

  -- maven
  {
    "eatgrass/maven.nvim",
    cmd = "Maven",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("maven").setup {
        executable = "./mvnw",
      }
    end,
  },

  -- markdown preview
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = { "Glow" },
  },

  -- dressing-nvim vim.select handling
  {
    "stevearc/dressing.nvim",
    event = "BufRead",
    config = function()
      require("dressing").setup()
    end,
  },

  -- auto save
  {
    "Pocco81/auto-save.nvim",
    event = "BufEnter",
    config = function()
      require "custom.configs.auto-save"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp_conf = require "plugins.configs.cmp"
      table.insert(cmp_conf.sources, { name = "codeium" })

      return cmp_conf
    end,
  },

  {
    "jcdickinson/http.nvim",
    build = "cargo build --workspace --release",
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-p>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      }
    end,
  },

  -- codeium
  -- {
  --   "jcdickinson/codeium.nvim",
  --   event = "BufEnter",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup {}
  --   end,
  -- },
}

return plugins
