return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    auto_preview = false,
    win = {
      size = 0.3,
    },
    modes = {
      diagnostics_buffer = {
        mode = "diagnostics",
        filter = { buf = 0 },
      },
    },
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)", },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
    { "<leader>cL", "<cmd>Trouble lsp toggle<cr>",                      desc = "LSP List of def. and ref. (Trouble)", },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols (Trouble)", },
  },
}
