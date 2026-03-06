return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  -- event = "InsertEnter",
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
      enabled = true,
      auto_refresh = true,
    },
    filetypes = {
      markdown = true,
      help = false,
      ["."] = false,
    },
  },
}
