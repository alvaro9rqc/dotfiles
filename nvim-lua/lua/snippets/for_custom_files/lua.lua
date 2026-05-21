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
  })
}
