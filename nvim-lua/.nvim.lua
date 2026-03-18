Pacha.setup_lsps({
  "lua_ls",
  "jsonls",
}, {
  lua_ls = {
    settings = {
      Lua = {
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          },
        },
        diagnostics = {
          globals = { "vim", "Pacha" },
        },
      },
    },
  },
})
Pacha.setup_linters({
  lua = { "luacheck" }, -- El 'key' es el filetype
})

vim.cmd("FormatToggle")
