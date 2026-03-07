return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    -- Diagnostics configuration
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

    -- On attach: keymaps when LSP connects to a buffer
    local on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "<leader>cd", vim.lsp.buf.definition, "Go to definition")
      map("n", "<leader>cy", vim.lsp.buf.type_definition, "Type definition")
      map("n", "<leader>ci", vim.lsp.buf.implementation, "Go to implementation")
      map("n", "<leader>cr", vim.lsp.buf.references, "References")
      map("n", "<leader>ct", vim.lsp.buf.hover, "Hover documentation")
      map("n", "<leader>ch", vim.lsp.buf.document_highlight, "Highlight references")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      map("n", "<leader>cn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "<leader>cs", vim.lsp.buf.signature_help, "Signature help")
      map("i", "<C-s>", vim.lsp.buf.signature_help, "Signature help")
      map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      map("n", "<leader>ce", vim.diagnostic.open_float, "Line diagnostics")

      -- Highlight references on cursor hold
      if client.server_capabilities.documentHighlightProvider then
        local highlight_group = vim.api.nvim_create_augroup("LspHighlight", { clear = false })
        vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = bufnr })
        vim.api.nvim_create_autocmd("CursorHold", {
          group = highlight_group,
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          group = highlight_group,
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    -- Capabilities from blink.cmp
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = require("core.lsp_servers")

    for server, server_config in pairs(servers) do
      local opts = vim.tbl_deep_extend("force", server_config, {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      vim.lsp.config(server, opts)
    end
  end,
}
