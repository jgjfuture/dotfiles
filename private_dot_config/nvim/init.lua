-- Buffer

vim.opt.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

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

if not vim.g.vscode then
  vim.g.mapleader = '<Space>'
end

-- Plugin
require("config.lazy")

-- file explorer
if not vim.g.vscode then
	require("oil").setup()
end

-- Environment Specific Configs
if vim.g.vscode then
  local vscode = require('vscode')

  -- keymap
  vim.keymap.set('n', '==', function() vscode.action("editor.action.formatDocument") end)
  vim.keymap.set('n', '[c', function() vscode.action("workbench.action.editor.nextChange"); vscode.action("workbench.action.compareEditor.nextChange") end)
  vim.keymap.set('n', ']c', function() vscode.action("workbench.action.editor.previousChange"); vscode.action("workbench.action.compareEditor.previousChange") end)
  vim.keymap.set('n', '[e', function() vscode.action("editor.action.marker.nextInFiles") end)
  vim.keymap.set('n', ']e', function() vscode.action("editor.action.marker.prevInFiles") end)
  vim.keymap.set('n', '<Space>', function() vscode.action("workbench.action.showCommands") end)
  vim.keymap.set('v', '<Space>', function() vscode.action("workbench.action.showCommands") end)
  vim.keymap.set('n', 'gI', function() vscode.action("editor.action.goToImplementation") end)
  vim.keymap.set('i', '<C-n>', function() vscode.action("editor.action.triggerSuggest"); end)
  vim.keymap.set('i', '<C-p>', function() vscode.action("editor.action.triggerSuggest"); end)

  local function vscode_only()
    vscode.action("workbench.action.closeOtherEditors")
  end
  vim.api.nvim_create_user_command('O', vscode_only, {force = true})
  vim.api.nvim_create_user_command('Only', vscode_only, {force = true})

  vim.opt.clipboard:append("unnamedplus")
else
  -- only for ordinal neovim
  vim.opt.relativenumber = true

  -- telescope settings
  local builtin = require('telescope.builtin')
  local function find_files_with_hidden()
    builtin.find_files({ hidden = true })
  end
  -- show hidden files (.gitignore is considered by default)
  vim.keymap.set('n', '<leader>ff', find_files_with_hidden, { desc = 'Telescope find files (including hidden)' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

  -- treesitter start on filetype
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
    callback = function(ctx)
      pcall(vim.treesitter.start)
    end,
  })

  -- autosave settings
  vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
    pattern = "*",
    command = "silent! wall"
  })
end

