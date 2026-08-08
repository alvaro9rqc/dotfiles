local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Just execute in .nvim.lua
local function nvim_lua_snippet(trig, name, body)
  return s({
    trig = trig,
    name = name,
    condition = function()
      return vim.fn.expand("%:t") == ".nvim.lua"
    end,
    show_condition = function()
      return vim.fn.expand("%:t") == ".nvim.lua"
    end,
  }, body)
end
-- ──────────────────────────────────────────────────────────────────────

return {

  -- For maven java
  nvim_lua_snippet("lsp_maven", "Configuración LSP JDTLS", {
    t(vim.split([[
local root_markers = { 'pom.xml', '.git' }
local root_dir = vim.fs.root(0, root_markers)
local project_name = root_dir and vim.fs.basename(root_dir) or "java_workspace"
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspaces/" .. project_name

vim.lsp.config.jdtls = {
  cmd = {
    'jdtls',
    '-data', workspace_dir
  },
  root_markers = root_markers,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      eclipse = { downloadSources = true },
      configuration = { updateBuildConfiguration = "interactive" },
      maven = { downloadSources = true }
    }
  }
}

vim.lsp.enable('jdtls')]], "\n")),

    i(0) -- Nodo final donde se quedará el cursor tras expandir
  }),
  -- for golang
  nvim_lua_snippet("lsp_gopls", "Configuración LSP gopls", {
    t(vim.split([[
local root_dir = vim.fs.root(0, { "go.mod", "proto" }) or vim.fn.getcwd()
vim.lsp.config.gopls = {
  root_dir = root_dir
}
vim.lsp.enable("gopls")]], "\n")),
    i(0)
  }),

  -- for typst
  nvim_lua_snippet("lsp_tinymist", "Configuración LSP gopls", {
    t(vim.split([[
-- Definición completa sin depender de lspconfig
vim.lsp.config.tinymist = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = {".nvim.lua", "laboratorio.typ", "typst.toml", ".git" },
  on_attach = function(client, bufnr)
    -- client.root_dir es expuesto directamente por la API
    local root = client.root_dir
    if not root then
      vim.notify("Tinymist: No se detectó root_dir", vim.log.levels.WARN)
      return
    end
    local main_file = vim.fs.joinpath(root, "laboratorio.typ")
    if vim.fn.filereadable(main_file) == 1 then
      client:request("workspace/executeCommand", {
        command = "tinymist.pinMain",
        arguments = { main_file },
      }, function(err)
          if err then
            vim.notify("Tinymist: Error al hacer pin: " .. err.message, vim.log.levels.ERROR)
          end
        end, bufnr)
    else
      vim.notify("Tinymist: No se encontró " .. main_file, vim.log.levels.ERROR)
    end
  end,
}
vim.lsp.enable("tinymist")]], "\n")),
    i(0)
  }),

  -- for uv: ruff and pyright
  nvim_lua_snippet("lsp_uv_pyright_ruff", "Configuración LSP with uv", {
    t(vim.split([[
local root_markers = { 'pyproject.toml', '.git' }
local root_dir = vim.fs.root(0, root_markers)

-- Identificamos la ruta exacta del intérprete que 'uv' creó en .venv
local python_path = root_dir and (root_dir .. "/.venv/bin/python") or "python"

vim.lsp.config.pyright = {
  -- Usamos 'uv run' para invocar el langserver directamente desde tus dev-dependencies
  cmd = { 'uv', 'run', 'pyright-langserver', '--stdio' },
  root_markers = root_markers,
  settings = {
    python = {
      pythonPath = python_path
    }
  }
}
vim.lsp.enable('pyright')

vim.lsp.config.ruff = {
  -- Invocamos el servidor LSP nativo de Ruff a través de uv
  cmd = { 'uv', 'run', 'ruff', 'server' },
  root_markers = root_markers,
}
vim.lsp.enable('ruff')]], "\n")),
    i(0)
  }),
}
