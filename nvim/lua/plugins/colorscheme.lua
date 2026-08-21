return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)

      local state_home = vim.env.XDG_STATE_HOME
      if not state_home or state_home == "" then
        state_home = vim.env.HOME .. "/.local/state"
      end
      local theme_file = state_home .. "/caelestia/theme/nvim.lua"

      local function apply_caelestia_theme()
        local ok, mode = pcall(dofile, theme_file)
        if not ok or (mode ~= "light" and mode ~= "dark") then
          mode = "dark"
        end

        local colorscheme = mode == "light" and "tokyonight-day" or "tokyonight-moon"
        if vim.g.colors_name ~= colorscheme then
          vim.cmd.colorscheme(colorscheme)
        end

        vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
        return colorscheme
      end

      -- The Caelestia post-hook calls this through Neovim's RPC socket so
      -- already-open editors update immediately after the template is rendered.
      _G.CaelestiaApplyTheme = apply_caelestia_theme

      local group = vim.api.nvim_create_augroup("caelestia_colorscheme", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = function()
          vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
        end,
        desc = "Keep folded lines transparent",
      })

      apply_caelestia_theme()
      -- vim.api.nvim_set_hl(0, "MsgArea", { fg = "#c0caf5", bg = "NONE" })
    end,
  },
}
