return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gwrite", "Gvdiffsplit" },
  keys = {
    { "<leader>gg", "<cmd>G<cr>", desc = "Git status" },
    { "<leader>ga", "<cmd>Gwrite<cr>", desc = "Git add file" },
    { "<leader>gr", "<cmd>Git restore --staged %<cr>", desc = "Git unstage file" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff split" },
  },
}
