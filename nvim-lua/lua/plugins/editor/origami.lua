return {
  "chrisgrieser/nvim-origami",
  lazy = false,
  opts = {
    useLspFoldsWithTreesitterFallback = {
      enabled = false,
      foldmethodIfNeitherIsAvailable = "manual",
    },
    pauseFoldsOnSearch = true,
    foldtext = {
      enabled = true,
      padding = 3,
      lineCount = {
        template = " %d lines",
        hlgroup = "Comment",
      },
      diagnosticsCount = true,
      gitsignsCount = true,
      disableOnFt = { "snacks_picker_input" },
    },
    autoFold = {
      enabled = false,
      kinds = { "comment", "imports" },
    },
    foldKeymaps = {
      setup = false,
      closeOnlyOnFirstColumn = false,
      scrollLeftOnCaret = false,
    },
  },
}
