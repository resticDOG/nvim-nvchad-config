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
    "NvChad/nvterm",
    opts = overrides.nvterm,
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
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "custom.configs.dapui"
    end,
  },

  -- nvim-jdtls
  {
    "mfussenegger/nvim-jdtls",
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
      require "custom.configs.actions-preview"
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

  -- neogit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
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

  -- use nvim as cursor
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      provider = "openai",
      openai = {
        endpoint = "https://models.inference.ai.azure.com/chat/completions#",
        model = "gpt-4o",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
        ["local"] = false,
      },
      azure = {
        endpoint = "https://models.inference.ai.azure.com/chat/completions#", -- example: "https://<your-resource-name>.openai.azure.com"
        deployment = "gpt-4o", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
        api_version = "2024-06-01",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
        ["local"] = false,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

return plugins
