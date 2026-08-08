return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
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
      ["*"] = true,
      markdown = true,
      help = false,
    },
  },
}
