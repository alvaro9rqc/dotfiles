--------------------------
--------------------------
-- VIUSAL INTERFACE
--------------------------
--------------------------
vim.o.relativenumber = true
vim.o.number = true
-- Show always status bar
vim.o.laststatus = 2
-- Show mode, such as 'Insert'
vim.o.showmode = true
-- Autocomplete in options
vim.o.conceallevel = 2
vim.o.cmdheight = 1
vim.o.guicursor = 'n-v-c:block'
-- cursor blinking
vim.o.guicursor = vim.o.guicursor .. ',a:blinkon1'
vim.o.syntax = "enable"
vim.o.showmatch = true
vim.o.showcmd = true
vim.o.cursorline = true


--------------------------
--------------------------
-- WORK FLOW
--------------------------
--------------------------
-- local .nvimrc
vim.o.exrc = true
vim.o.wildmode = 'list:longest,longest:full'
vim.o.incsearch = true
vim.o.timeoutlen = 500
vim.o.clipboard = ''


--------------------------
--------------------------
-- PREFERENCES
--------------------------
--------------------------
vim.o.spelllang = 'es'
vim.o.shiftwidth = 2
vim.o.encoding = 'utf-8'
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.breakindentopt = 'shift:2'
vim.o.autoindent = true


--------------------------
--------------------------
-- TABULATION
--------------------------
--------------------------
vim.o.expandtab = true
vim.o.tabstop = 2


--------------------------
--------------------------
-- FOLDING
--------------------------
--------------------------
vim.o.foldmethod = 'manual'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = '1'
vim.opt.fillchars = { foldopen = "", foldclose = "" }
-- vim.opt.signcolumn = "number"
vim.opt.viewoptions:append({ "folds", "cursor", "curdir" })

pcall(function()
  vim.treesitter.query.set("vim", "highlights", "")
  vim.treesitter.query.set("vimdoc", "highlights", "")
end)


--------------------------
--------------------------
-- IGNORED FILES
--------------------------
--------------------------
vim.opt.wildignore:append({ '*.class', '*.out' })


--------------------------
--------------------------
-- THIRD PARTY
--------------------------
--------------------------
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.skip_defaults_vim = 1

require("core.maps")
require("core.autocmds")
