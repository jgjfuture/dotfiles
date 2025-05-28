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

-- Plugin
require("config.lazy")

-- Environment Specific Configs
if vim.g.vscode then
  local vscode = require('vscode')

  -- keymap
  vim.keymap.set('n', '==', function() vscode.action("editor.action.formatDocument") end)
  vim.keymap.set('n', '[c', function() vscode.action("workbench.action.editor.nextChange") end)
  vim.keymap.set('n', ']c', function() vscode.action("workbench.action.editor.previousChange") end)
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
end
