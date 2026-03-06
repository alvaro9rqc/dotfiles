return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  opts = {
    options = {
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "lazy" } },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { { 'filename', path = 1 }, 'diff', 'diagnostics' },
      lualine_c = { 'branch' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
