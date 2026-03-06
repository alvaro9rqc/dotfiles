return {
  "mattn/emmet-vim",
  ft = { "html", "css", "scss", "jsx", "tsx", "astro", "vue", "typescriptreact", "javascriptreact" },
  init = function()
    vim.g.user_emmet_leader_key = '<A-e>'
  end,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "astro",
      command = "EmmetInstall",
    })
  end,
}
