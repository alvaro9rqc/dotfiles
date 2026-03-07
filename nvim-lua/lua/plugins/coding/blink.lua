return {
  "saghen/blink.cmp",
  version = "1.*",
  opts_extend = {
    "sources.default",
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
    -- Eliminado: "giuxtaposition/blink-cmp-copilot"
  },
  event = { "InsertEnter", "CmdlineEnter" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = {
      preset = "luasnip",
    },
    sources = {
      -- Ahora es una lista estática, sin inyecciones raras
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
    appearance = {
      kind_icons = Pacha.icons.kinds,
    },
  },
}
