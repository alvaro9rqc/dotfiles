return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require("luasnip")

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load project-local snipmate snippets
    require("luasnip.loaders.from_snipmate").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/lua/snippets/snipmate" },
    })

    -- Configure LuaSnip
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
    })
  end,
}
