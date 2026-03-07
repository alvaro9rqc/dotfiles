return {
  "folke/neoconf.nvim",
  lazy = false,
  dependencies = {
    "folke/lazydev.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    plugins = {
      lspconfig = {
        enabled = false,
      },
    },
  },
}
