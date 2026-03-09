local M = {}
M._pending_linters = {}
M._pending_formatters = {}

local function get_lsp_capabilities()
	local has_blink, blink = pcall(require, "blink.cmp")
	if has_blink and type(blink.get_lsp_capabilities) == "function" then
		return blink.get_lsp_capabilities()
	end
	return vim.lsp.protocol.make_client_capabilities()
end

function M.setup_lsps(servers, custom_opts)
	if type(servers) ~= "table" then
		vim.notify("Pacha.setup_lsps espera una lista de servidores", vim.log.levels.ERROR)
		return
	end

	local has_lsp_configs, lsp_configs = pcall(require, "lspconfig.configs")
	if not has_lsp_configs then
		vim.notify("nvim-lspconfig no está disponible", vim.log.levels.WARN)
		return
	end

	custom_opts = custom_opts or {}
	local base_capabilities = get_lsp_capabilities()

	for _, server in ipairs(servers) do
		local server_opts = custom_opts[server] or {}
		local merged_capabilities = vim.tbl_deep_extend("force", {}, base_capabilities, server_opts.capabilities or {})

		local opts = vim.tbl_deep_extend("force", {}, server_opts, {
			capabilities = merged_capabilities,
		})

		local server_config = lsp_configs[server]
		if not server_config then
			local has_server, config_def = pcall(require, "lspconfig.configs." .. server)
			if has_server then
				lsp_configs[server] = config_def
				server_config = lsp_configs[server]
			end
		end

		if not server_config or type(server_config.setup) ~= "function" then
			vim.notify(('LSP "%s" no está disponible en nvim-lspconfig'):format(server), vim.log.levels.WARN)
		else
			server_config.setup(opts)
		end
	end
end

function M.setup_linters(linters_map)
	if type(linters_map) ~= "table" then
		vim.notify("Pacha.setup_linters espera una tabla filetype -> linters", vim.log.levels.ERROR)
		return
	end

	local has_lint, lint = pcall(require, "lint")
	if has_lint then
		lint.linters_by_ft = vim.tbl_deep_extend("force", lint.linters_by_ft or {}, linters_map)
		return
	end

	M._pending_linters = vim.tbl_deep_extend("force", M._pending_linters, linters_map)
end

function M.consume_pending_linters()
	local pending = M._pending_linters
	M._pending_linters = {}
	return pending
end

function M.setup_formatters(formatters_map)
	if type(formatters_map) ~= "table" then
		vim.notify("Pacha.setup_formatters espera una tabla filetype -> formatters", vim.log.levels.ERROR)
		return
	end

	local has_conform, conform = pcall(require, "conform")
	if has_conform then
		conform.formatters_by_ft = vim.tbl_deep_extend("force", conform.formatters_by_ft or {}, formatters_map)
		return
	end

	M._pending_formatters = vim.tbl_deep_extend("force", M._pending_formatters, formatters_map)
end

function M.consume_pending_formatters()
	local pending = M._pending_formatters
	M._pending_formatters = {}
	return pending
end

return M
