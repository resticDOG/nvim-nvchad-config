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
    event = "BufRead",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
      "jay-babu/mason-nvim-dap.nvim",
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
  -- {
  --   "nathom/filetype.nvim",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.filetype"
  --   end,
  -- },

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
    cmd = "Trouble",
    config = function()
      require "custom.configs.trouble"
    end,
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
      table.insert(cmp_conf.sources, { name = "codecompanion" })

      return cmp_conf
    end,
  },

  -- nvim ai coding
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    lazy = false,
    config = function()
      require "custom.configs.codecompanion.config"
    end,
    init = function()
      require("custom.configs.codecompanion.fidget"):init()
    end,
  },

  -- Avante
  {
    "yetone/avante.nvim",
    -- 如果您想从源代码构建，请执行 `make BUILD_FROM_SOURCE=true`
    build = "make", -- ⚠️ 一定要加上这一行配置！！！！！
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- 对于 Windows
    event = "VeryLazy",
    version = false, -- 永远不要将此值设置为 "*"！永远不要！
    config = function()
      require "custom.configs.avante"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- 以下依赖项是可选的，
      "echasnovski/mini.pick", -- 用于文件选择器提供者 mini.pick
      "nvim-telescope/telescope.nvim", -- 用于文件选择器提供者 telescope
      "hrsh7th/nvim-cmp", -- avante 命令和提及的自动完成
      "ibhagwan/fzf-lua", -- 用于文件选择器提供者 fzf
      "nvim-tree/nvim-web-devicons", -- 或 echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- 用于 providers='copilot'
      {
        -- 支持图像粘贴
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- 推荐设置
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- Windows 用户必需
            use_absolute_path = true,
          },
        },
      },
    },
  },

  -- mcp hub
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    -- uncomment the following line to load hub lazily
    -- cmd = { "MCPHub", "CodeCompanion" }, -- lazy load
    lazy = false,
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
    -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    config = function()
      require("mcphub").setup {
        extensions = {
          codecompanion = {
            -- Show the mcp tool result in the chat buffer
            auto_approve = true,
            show_result_in_chat = true,
            make_vars = true, -- make chat #variables from MCP server resources
            make_slash_commands = true, -- make /slash_commands from MCP server prompts
            auto_toggle_mcp_servers = true,
          },
        },
      }
    end,
  },

  -- render-markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "codecompanion", "Avante" },
    },
    ft = { "markdown", "codecompanion", "Avante" },
  },

  -- mini-diff
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.diff").setup()
    end,
  },

  -- session manager
  {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = true,
  },

  -- tabby llm code
  {
    "TabbyML/vim-tabby",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    init = function()
      vim.g.tabby_agent_start_command = { "npx", "tabby-agent", "--stdio" }
      vim.g.tabby_inline_completion_trigger = "auto"
    end,
  },
}

return plugins
