return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>c", group = "Code/LSP" },
      { "<leader>t", group = "Toggle/Tabs" },
      { "<leader>x", group = "Trouble/Lists" },
      { "<leader>a", group = "AI" },
      { "<leader>u", group = "UI/Utils" },
      { "<leader>y", group = "Clipboard" },
    },
  },
}
