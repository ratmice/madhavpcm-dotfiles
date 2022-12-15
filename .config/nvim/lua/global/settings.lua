vim.opt.number = true
vim.opt.ignorecase =  true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Keymaps
--

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>ww', '<cmd>write<cr>', {desc = 'Save'})


-- Clipboard
--
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, '<C-c>', '"*y')
vim.keymap.set({'n', 'v'}, '<C-p>', '"*p')

