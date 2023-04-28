local present, dapui = pcall(require, "dapui")
if not present then
  return
end

dapui.setup {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25,
        },
        {
          id = "breakpoints",
          size = 0.25,
        },
        {
          id = "stacks",
          size = 0.25,
        },
        {
          id = "watches",
          size = 0.25,
        },
      },
      position = "left",
      size = 20,
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.2,
        },
        {
          id = "console",
          size = 0.8,
        },
      },
      position = "bottom",
      size = 15,
    },
  },
}
