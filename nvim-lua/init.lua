require("core")
vim.o.relativenumber = true
vim.o.number = true
vim.o.laststatus = 2
vim.o.showmode = true
vim.o.wildmode = 'list:longest,longest:full'
vim.o.conceallevel = 2
vim.o.spelllang = 'es'
vim.o.guicursor = 'n-v-c:block'
vim.o.guicursor = vim.o.guicursor .. ',a:blinkon1'
vim.o.exrc = true
vim.o.syntax = "enable"
vim.cmd("colorscheme industry")
print("Hola Mundo")
