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

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    cmd = { "HopChar1CurrentLine", "HopChar1" },
    config = function()
      require("hop").setup()
    end,
  },

  -- java support
  {
    "mfussenegger/nvim-jdtls",
  },

  {
    "mfussenegger/nvim-dap",
  },
  -- dap ui
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },

  -- lsp progress ui
  {
    "j-hui/fidget.nvim",
    lazy = false,
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
  {
    "nathom/filetype.nvim",
    lazy = false,
    config = function()
      require "custom.configs.filetype"
    end,
  },

  -- vim fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "custom.configs.copilot"
    end,
  },
}

return plugins
