_G.Pacha = {}

Pacha.author = "Alvaro R. Quispe Condori"

Pacha.icons = require("core.icons")
do
  local lsp_wrappers = require("core.lsp_wrappers")
  Pacha.setup_lsps = lsp_wrappers.setup_lsps
  Pacha.setup_linters = lsp_wrappers.setup_linters
  Pacha.setup_formatters = lsp_wrappers.setup_formatters
end

-- Main function

function Main()
  -- print(Pacha.icons.git.added)
  require("core")
  require("lazyconf")
end

Main()
