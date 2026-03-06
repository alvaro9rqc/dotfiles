return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local python_linters = vim.fn.executable("ruff") == 1 and { "ruff" } or {}

    lint.linters_by_ft = {
      javascript = vim.fn.executable("eslint_d") == 1 and { "eslint_d" } or { "eslint" },
      typescript = vim.fn.executable("eslint_d") == 1 and { "eslint_d" } or { "eslint" },
      javascriptreact = vim.fn.executable("eslint_d") == 1 and { "eslint_d" } or { "eslint" },
      typescriptreact = vim.fn.executable("eslint_d") == 1 and { "eslint_d" } or { "eslint" },
      python = python_linters,
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        if vim.opt_local.modifiable:get() then
          lint.try_lint()
        end
      end,
    })
  end,
}
