return {
  "saghen/blink.cmp", 
  version = "1.*",
  --build = "cargo build --release",
  opts_extend = {
    "sources.default", -- It extends the list and does not overwrite it if another plugin tries to add more sources.
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = { "InsertEnter", "CmdlineEnter" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = {
      preset = "default",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      accept = {
	auto_brackets = { enabled = true, },
      },
      menu = {
	-- coloring for recommendations in lsp
	draw = { treesitter = { "lsp" }, },
      },
      documentation = {
	auto_show = true,
	auto_show_delay_ms = 200,
      },
    },
  },
}
