vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, desc = 'Quit' })

-- Tab navigation
vim.keymap.set('n', '<leader>h', 'gT', { noremap = true, desc = 'Previous tab' })
vim.keymap.set('n', '<leader>l', 'gt', { noremap = true, desc = 'Next tab' })
vim.keymap.set('n', '<leader>ta', ':tabe %:h<C-d>/', { noremap = true, desc = 'Open new tab' })

-- Clipboard (manual copy)
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>yy', '"+yy', { noremap = true, desc = 'Copy line to clipboard' })

-- Window resize
vim.keymap.set('n', '<leader>>', '6<C-w>>', { noremap = true, desc = 'Increase width' })
vim.keymap.set('n', '<leader><', '6<C-w><', { noremap = true, desc = 'Decrease width' })
vim.keymap.set('n', '<leader>+', '2<C-w>+', { noremap = true, desc = 'Increase height' })
vim.keymap.set('n', '<leader>-', '2<C-w>-', { noremap = true, desc = 'Decrease height' })
