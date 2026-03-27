local overrides = require "custom.configs.overrides"

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    commit = "339ccc8",
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
    "nvim-telescope/telescope.nvim",
    commit = "415af52",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "f197a15",
    opts = overrides.treesitter,
  },
  {
    "NvChad/nvterm",
    commit = "9d7ba3b",
    opts = overrides.nvterm,
  },

  {
    "williamboman/mason.nvim",
    commit = "e2f7f90",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    commit = "d529a99",
    opts = overrides.nvimtree,
  },

  {
    "phaazon/hop.nvim",
    commit = "1a1ecea",
    cmd = { "HopChar1CurrentLine", "HopChar1" },
    config = function()
      require("hop").setup()
    end,
  },

  -- dap ui
  {
    "rcarriga/nvim-dap-ui",
    commit = "727c032",
    event = "BufRead",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      -- {
      --   "mfussenegger/nvim-dap-python",
      --   opts = {
      --     rocks = {
      --       enable = false,
      --       hererocks = false,
      --     },
      --   },
      -- },
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require "custom.configs.dapui"
    end,
  },

  -- nvim-jdtls
  {
    "mfussenegger/nvim-jdtls",
    commit = "baae618",
  },

  -- autotag
  {
    "windwp/nvim-ts-autotag",
    commit = "1cca23c",
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
    commit = "9f52a01",
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
    commit = "060a625",
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
    commit = "161b005",
    event = "BufRead",
    config = function()
      require("nu").setup {}
    end,
  },

  -- trouble nvim
  {
    "folke/trouble.nvim",
    commit = "50481f4",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    config = function()
      require "custom.configs.trouble"
    end,
  },

  -- dressing-nvim vim.select handling
  {
    "stevearc/dressing.nvim",
    commit = "3a45525",
    event = "BufRead",
    config = function()
      require("dressing").setup()
    end,
  },

  -- auto save
  {
    "Pocco81/auto-save.nvim",
    commit = "979b6c8",
    event = "BufEnter",
    config = function()
      require "custom.configs.auto-save"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "hrsh7th/cmp-path",
        commit = "91ff86c",
      },
      {
        "hrsh7th/cmp-nvim-lua",
        commit = "f12408b",
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        commit = "99290b3",
      },
      {
        "hrsh7th/cmp-buffer",
        commit = "3022dbc",
      },
    },
    commit = "8c82d0b",
    opts = function()
      local cmp_conf = require "plugins.configs.cmp"
      table.insert(cmp_conf.sources, { name = "codecompanion" })

      return cmp_conf
    end,
  },

  -- nvim ai coding
  {
    "olimorris/codecompanion.nvim",
    commit = "35b11dc",
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
    commit = "7965546",
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
  -- fcitx5 nvim
  {
    "pysan3/fcitx5.nvim",
    event = { "ModeChanged" },
    config = function()
      require("fcitx5").setup {
        -- msg = nil, -- string | nil: printed when startup is completed
        msg = "fcitx5 setup success", -- string | nil: printed when startup is completed
        imname = { -- fcitx5.Imname | nil: imnames on each mode set as prior. See `:h map-table` for more in-depth information.
          norm = nil, -- string | nil: imname to set in normal mode. if nil, will restore the mode on exit.
          ins = nil,
          cmd = nil,
          vis = nil,
          sel = nil,
          opr = nil,
          term = nil,
          lang = nil,
        },
        remember_prior = true, -- boolean: if true, it remembers the mode on exit and restore it when entering the mode again.
        --                                 if false, uses what was set in config.
        define_autocmd = true, -- boolean: if true, defines autocmd at `ModeChanged` to switch fcitx5 mode.
        autostart_fcitx5 = true, -- boolean: if true, autostarts `fcitx5` when it is not running.
        log = "warn", -- string: log level (default: warn)
      }
    end,
  },

  -- render-markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    commit = "be3e3ab",
    opts = {
      file_types = { "markdown", "codecompanion", "Avante" },
    },
    ft = { "markdown", "codecompanion", "Avante" },
  },

  -- mini-diff
  {
    "echasnovski/mini.nvim",
    commit = "9e603a3",
    version = false,
    config = function()
      require("mini.diff").setup()
    end,
  },
}

return plugins
