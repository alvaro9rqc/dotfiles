return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = { spacing = 4, prefix = Pacha.icons.misc.dots },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = Pacha.icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = Pacha.icons.diagnostics.Warn,
          [vim.diagnostic.severity.HINT] = Pacha.icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = Pacha.icons.diagnostics.Info,
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("PachaLspConfig", { clear = true }),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
        end

        map("n", "<leader>cr", vim.lsp.buf.references, "References")
        map("n", "<leader>ch", vim.lsp.buf.document_highlight, "Highlight references")
        -- map("n", "<leader>cs", vim.lsp.buf.signature_help, "Signature help")
        map("n", "<leader>ce", vim.diagnostic.open_float, "Line diagnostics")

        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_group = vim.api.nvim_create_augroup("PachaLspHighlight", { clear = false })
          vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = ev.buf })
          vim.api.nvim_create_autocmd("CursorHold", {
            group = highlight_group,
            buffer = ev.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = highlight_group,
            buffer = ev.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end
    })
  end,
}
