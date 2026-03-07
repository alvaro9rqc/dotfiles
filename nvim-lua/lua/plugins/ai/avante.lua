return {
  "yetone/avante.nvim",
  version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
  },
  opts = {
    provider = "copilot",
    providers = {
      copilot = {
        model = "gpt-5.3-codex",
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
    },
    windows = {
      position = "right",
      width = 30,
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
  },
  keys = {
    { "<leader>aa", function() require("avante.api").ask() end, desc = "Avante: Ask", mode = { "n", "v" } },
    { "<leader>aA", function() require("avante.api").toggle() end, desc = "Avante: Toggle" },
  },
}
