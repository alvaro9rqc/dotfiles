return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    sign = {
      enabled = false,
    },
    heading = {
      sign = false,
      width = 'block',
    },
    code = {
      sign = false,
    },
  },
}
