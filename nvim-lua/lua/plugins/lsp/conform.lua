return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},
	opts = function()
		local lsp_wrappers = require("core.lsp_wrappers")
		return {
			formatters_by_ft = vim.tbl_deep_extend("force", {}, lsp_wrappers.consume_pending_formatters()),
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 3000, lsp_fallback = true }
			end,
		}
	end,
	init = function()
		vim.g.disable_autoformat = true
		vim.api.nvim_create_user_command("FormatToggle", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
			if vim.g.disable_autoformat then
				vim.notify("Format on save disabled", vim.log.levels.INFO)
			else
				vim.notify("Format on save enabled", vim.log.levels.INFO)
			end
		end, { desc = "Toggle format on save" })
	end,
}
