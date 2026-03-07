local function copilot_is_active()
  return #vim.lsp.get_clients({ name = "copilot", bufnr = 0 }) > 0
end

return {
  "saghen/blink.cmp",
  version = "1.*",
  opts_extend = {
    "sources.default",
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
    "giuxtaposition/blink-cmp-copilot",
  },
  event = { "InsertEnter", "CmdlineEnter" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = {
      preset = "luasnip",
    },
    sources = {
      default = function()
        local providers = { "lsp", "path", "snippets", "buffer" }
        if copilot_is_active() then
          table.insert(providers, 1, "copilot")
        end
        return providers
      end,
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
          enabled = copilot_is_active,
        },
      },
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
