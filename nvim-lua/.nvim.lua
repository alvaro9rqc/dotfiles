Pacha.setup_lsps({
  "lua_ls",
  "jsonls",
})
Pacha.setup_linters({
  lua = { "luacheck" }, -- El 'key' es el filetype
})

vim.cmd("FormatToggle")
