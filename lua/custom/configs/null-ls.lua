local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- git
  b.code_actions.gitsigns,
  b.completion.spell,

  -- web dev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettierd.with {
    -- disabled_filetypes = { "markdown" },
    extra_args = {
      "--print-config",
      "--log-level=error",
      "--print-width=120",
      "--tab-width=2",
    },
    prefer_local = ".venv/bin",
  },
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d, -- eslintd

  -- lua
  b.formatting.stylua,

  -- python
  b.formatting.black,
  b.diagnostics.flake8.with {
    extra_args = {
      "--max-line-length=120",
      "--ignore=E203,W503,E501,F401",
      "--exclude=venv/*,build/*",
    },
    prefer_local = ".venv/bin",
  },
}

-- farmat on save

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr,
  }
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
