local present, avante = pcall(require, "avante")
if not present then
  return
end

avante.setup {
  -- add any opts here
  provider = "github_model",
  auto_suggestions_provider = "starcoder",
  vendors = {
    groq = {
      __inherited_from = "openai",
      api_key_name = "GROQ_API_KEY",
      endpoint = "https://api.groq.com/openai/v1/",
      model = "llama-3.1-70b-versatile",
    },
    github_model = {
      __inherited_from = "openai",
      api_key_name = "GITHUB_API_KEY",
      endpoint = "https://models.inference.ai.azure.com/chat/completions#",
      model = "gpt-4o",
    },
    ollama = {
      __inherited_from = "openai",
      api_key_name = "",
      endpoint = "http://10.1.1.63:11434/v1",
      model = "qwen2.5-coder",
    },
    qwen = {
      __inherited_from = "openai",
      api_key_name = "",
      endpoint = "http://10.1.1.63:11434/v1",
      model = "qwen2.5-coder:1.5b",
    },
    starcoder = {
      __inherited_from = "openai",
      api_key_name = "",
      endpoint = "http://10.1.1.63:11434/v1",
      model = "starcoder2:7b",
    },
    qwencoder = {
      __inherited_from = "openai",
      api_key_name = "NEW_API_KEY",
      endpoint = "http://10.1.1.137:3060/v1",
      model = "qwen/qwen-2.5-coder-32b-instruct",
    },
    deepseek = {
      __inherited_from = "openai",
      api_key_name = "NEW_API_KEY",
      endpoint = "https://newapi.linkzz.hm/v1",
      model = "deepseek/deepseek-chat",
    },
    claude = {
      __inherited_from = "openai",
      api_key_name = "NEW_API_KEY",
      endpoint = "http://10.1.1.137:3060/v1",
      model = "anthropic/claude-3.5-sonnet",
    },
  },
  dual_boost = {
    enabled = false,
    first_provider = "openai",
    second_provider = "claude",
    prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
    timeout = 60000, -- Timeout in milliseconds
  },
  behaviour = {
    auto_suggestions = false, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
  },
  mappings = {
    --- @class AvanteConflictMappings
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      apply_all = "A",
      apply_cursor = "a",
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
  },
  hints = { enabled = true },
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = "right", -- the position of the sidebar
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      enabled = true, -- true, false to enable/disable the header
      align = "center", -- left, center, right for title
      rounded = true,
    },
    input = {
      prefix = "> ",
      height = 8, -- Height of the input window in vertical layout
    },
    edit = {
      border = "rounded",
      start_insert = true, -- Start insert mode when opening the edit window
    },
    ask = {
      floating = false, -- Open the 'AvanteAsk' prompt in a floating window
      start_insert = true, -- Start insert mode when opening the ask window
      border = "rounded",
      ---@type "ours" | "theirs"
      focus_on_apply = "ours", -- which diff to focus after applying
    },
  },
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  --- @class AvanteConflictUserConfig
  diff = {
    autojump = true,
    ---@type string | fun(): any
    list_opener = "copen",
    --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
    --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
    --- Disable by setting to -1.
    override_timeoutlen = 500,
  },
}
