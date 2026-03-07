return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  opts = {
    suggestion = {
      enabled = false,
      auto_trigger = false,
      keymap = {
        accept = "<C-l>",
        accept_word = "<M-j>",
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = {
      enabled = false,
      auto_refresh = false,
    },
    filetypes = {
      ["*"] = false,
      markdown = true,
      help = false,
    },
  },
}
