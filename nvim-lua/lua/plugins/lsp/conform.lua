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
	opts = {
		formatters_by_ft = {},
		format_on_save = function(bufnr)
			-- Disable format on save for certain filetypes or if disabled
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 3000, lsp_fallback = true }
		end,
	},
	init = function()
		-- Toggle format on save
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
