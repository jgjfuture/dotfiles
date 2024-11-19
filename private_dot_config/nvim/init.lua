-- Buffer
vim.opt.relativenumber = true
vim.opt.hlsearch = true

-- Command mode

-- Insert mode
-- Remap
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })

-- Normal mode
-- Remap
vim.keymap.set('n', '<C-j>', '5j', { noremap = true })
vim.keymap.set('n', '<C-k>', '5k', { noremap = true })
vim.keymap.set('n', '<Esc>', ':nohl<CR>', { noremap = true, silent = true })

-- Visual mode
-- Remap
vim.keymap.set('v', '<C-j>', '5j', { noremap = true })
vim.keymap.set('v', '<C-k>', '5k', { noremap = true })

-- Plugin
-- Enable matchit plugin
vim.cmd('packadd! matchit')
