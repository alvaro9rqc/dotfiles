return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>m", mode = { "n", "x", "o" }, function() require("flash").jump({ jump = { pos = "end" } }) end, desc = "Flash to the end" },
    { "<leader>M", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,                     desc = "Flash Treesitter" },
    { "r",         mode = "o",               function() require("flash").remote() end,                         desc = "Remote Flash" },
    { "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end,              desc = "Treesitter Search" },
  },
}
