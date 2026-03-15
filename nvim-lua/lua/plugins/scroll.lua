return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opts = {
    mappings = {}, -- desactiva todos los mappings por defecto
  },
  config = function()
    local neoscroll = require("neoscroll")

    local keymap = {
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 150 }) end,
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 150 }) end,
      ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 300 }) end,
      ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 300 }) end,

      ["zt"] = function() neoscroll.zt({ half_win_duration = 150 }) end,
      ["zz"] = function() neoscroll.zz({ half_win_duration = 150 }) end,
      ["zb"] = function() neoscroll.zb({ half_win_duration = 150 }) end,
    }

    for key, func in pairs(keymap) do
      vim.keymap.set({ "n", "v", "x" }, key, func, { silent = true })
    end
  end,
}
