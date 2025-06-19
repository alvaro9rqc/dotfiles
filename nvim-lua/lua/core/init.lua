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
vim.o.guicursor = 'n-v-c:block'
-- cursor blinking
vim.o.guicursor = vim.o.guicursor .. ',a:blinkon1'
vim.o.syntax = "enable"




--------------------------
--------------------------
-- WORK FLOW
--------------------------
--------------------------
-- local .nvimrc
vim.o.exrc = true
vim.o.wildmode = 'list:longest,longest:full'



--------------------------
--------------------------
-- PREFERENCES
--------------------------
--------------------------
vim.o.spelllang = 'es'
vim.o.shiftwidth = 2

require("core.maps")
