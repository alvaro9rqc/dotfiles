return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "folke/snacks.nvim", -- Añadido para asegurar que Snacks cargue y provea la vista
  },
  opts = {
    -- Para usar la línea de comandos clásica, la documentación oficial de Noice
    -- advierte: "If you enable messages, then the cmdline is enabled automatically".
    -- Por limitación de Neovim, DEBES desactivar ambos para que funcione.
    cmdline = { enabled = false },
    messages = { enabled = false },
    popupmenu = { enabled = false },

    -- Configuración clave para unificar notificaciones
    notify = {
      enabled = true,
      view = "snacks",
    },

    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
}
