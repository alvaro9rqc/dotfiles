local lint = require("lint")

-- 1. Configuración de LSPs (Nueva API nativa de Neovim)

-- Habilitar jsonls directamente usando su configuración por defecto
vim.lsp.enable("jsonls")

vim.lsp.config.lua_ls.settings = vim.tbl_deep_extend("force", vim.lsp.config.lua_ls.settings or {}, {
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
})

vim.lsp.enable("lua_ls")

-- 2. Configuración de Linters
lint.linters_by_ft.lua = { "luacheck" }
vim.g.disable_autoformat = false
