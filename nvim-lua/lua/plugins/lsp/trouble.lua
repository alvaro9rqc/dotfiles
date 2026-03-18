return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    auto_preview = false,
    win = {
      size = 0.3,
    },
    keys = {
      ["<c-t>"] = {
        action = function(_, ctx)
          if ctx.item then
            local item = ctx.item
            item.buf = item.buf or vim.fn.bufadd(item.filename)
            if not vim.api.nvim_buf_is_loaded(item.buf) then
              vim.fn.bufload(item.buf)
            end
            vim.cmd("tabnew")
            local win = vim.api.nvim_get_current_win()
            vim.api.nvim_win_set_buf(win, item.buf)
            vim.api.nvim_win_set_cursor(win, item.pos)
            vim.cmd("norm! zzzv")
          end
        end,
        desc = "Open in new tab",
      },
    },
    modes = {
      lsp_base = {
        params = {
          include_current = true,
        }
      },
      lsp = {
        params = {
          include_current = true,
        }
      },
      lsp_references = {
        params = {
          include_current = true,
        }
      },
    },
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)", },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
    { "<leader>cl", "<cmd>Trouble lsp toggle win.position=right<cr>",   desc = "LSP List of def. and ref. (Trouble)", },
    { "<leader>cs", "<cmd>Trouble symbols toggle <cr>",                 desc = "Symbols (Trouble)", },
  },
}
