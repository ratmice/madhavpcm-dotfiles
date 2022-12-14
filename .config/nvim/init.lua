-- Init
--

require('global.vars')
require('plugins.packer')
require('plugins.color')
require('plugins.lualine')

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
-- Copying by treating internal clipboard as separate
vim.keymap.set({'n','x'}, 'cp', '"+y')
vim.keymap.set({'n','x'}, 'cv', '"+p')
vim.keymap.set({'n','x'}, 'x', '"_x')
vim.keymap.set({'n','x'}, 'x', '"_x')
vim.keymap.set('n', '<leader>A', ':keepjumps normal! ggVG<cr>')


