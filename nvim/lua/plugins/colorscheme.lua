return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight-moon")
      vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MsgArea", { fg = "#c0caf5", bg = "NONE" })
    end,
  },
}
