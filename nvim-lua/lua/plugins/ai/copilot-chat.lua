return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
  build = "make tiktoken",
  cmd = {
    "CopilotChat",
    "CopilotChatExplain",
    "CopilotChatReview",
    "CopilotChatFix",
    "CopilotChatOptimize",
    "CopilotChatDocs",
    "CopilotChatTests",
    "CopilotChatCommit",
  },
  opts = {
    model = "gpt-4o",
    window = {
      layout = "vertical",
      width = 0.4,
    },
  },
  keys = {
    { "<leader>ac", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
    { "<leader>ae", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code" },
    { "<leader>ar", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review code" },
    { "<leader>af", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix code" },
    { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize code" },
    { "<leader>ad", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Generate docs" },
    { "<leader>at", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }, desc = "Generate tests" },
    { "<leader>am", "<cmd>CopilotChatCommit<cr>", desc = "Generate commit message" },
    {
      "<leader>ap",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.snacks").pick(actions.prompt_actions())
      end,
      desc = "Copilot prompt actions",
      mode = { "n", "v" },
    },
  },
}
