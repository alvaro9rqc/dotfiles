return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    auto_preview = false,
    win = { position = "right", width = 40 },
    modes = {
      diagnostics_buffer = {
        mode = "diagnostics",
        filter = { buf = 0 },
      },
    },
  },
  keys = {
    {
      "<leader>xx",
      function()
        require("trouble").toggle("diagnostics")
      end,
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      function()
        require("trouble").toggle("diagnostics_buffer")
      end,
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xq",
      function()
        require("trouble").toggle("qflist")
      end,
      desc = "Quickfix List (Trouble)",
    },
    {
      "<leader>xl",
      function()
        require("trouble").toggle("loclist")
      end,
      desc = "Location List (Trouble)",
    },
    {
      "<leader>cL",
      function()
        require("trouble").toggle({ mode = "lsp", focus = false, source = "" })
      end,
      desc = "LSP List of def. and ref. (Trouble)",
    },
    {
      "<leader>cs",
      function()
        require("trouble").toggle({ mode = "symbols", focus = false, source = ""})
      end,
      desc = "Symbols (Trouble)",
    },
  },
}
