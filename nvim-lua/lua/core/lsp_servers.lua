local M = {}

M.lua_ls = {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim", "Pacha", "Snacks" },
      },
    },
  },
}

return M
