-- 1. Configuración de diagnósticos sin el wrapper VimEnter y con Lua correcto
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = function(diagnostic)
      local line_diags = vim.diagnostic.get(diagnostic.bufnr, { lnum = diagnostic.lnum })
      if #line_diags > 1 then
        return ""
      end
      return (Pacha and Pacha.icons and Pacha.icons.misc.dots) or "●"
    end,
    format = function(diagnostic)
      local line_diags = vim.diagnostic.get(diagnostic.bufnr, { lnum = diagnostic.lnum })
      if #line_diags > 1 then
        return ""
      end
      return diagnostic.message
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = (Pacha and Pacha.icons) and Pacha.icons.diagnostics.Error or "E",
      [vim.diagnostic.severity.WARN]  = (Pacha and Pacha.icons) and Pacha.icons.diagnostics.Warn or "W",
      [vim.diagnostic.severity.HINT]  = (Pacha and Pacha.icons) and Pacha.icons.diagnostics.Hint or "H",
      [vim.diagnostic.severity.INFO]  = (Pacha and Pacha.icons) and Pacha.icons.diagnostics.Info or "I",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("PachaLspConfig", { clear = true }),
  callback = function(ev)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end
    map("n", "<leader>cd", vim.lsp.buf.definition, "Go to definition")
    map("n", "<leader>ch", vim.lsp.buf.document_highlight, "Highlight references")
  end
})

-- 3. Definición nativa del servidor lua_ls
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      telemetry = { enable = false },
    },
  }
}

-- 4. Activar el servidor
vim.lsp.enable("lua_ls")
