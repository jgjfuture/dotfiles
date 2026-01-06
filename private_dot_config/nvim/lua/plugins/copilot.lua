return {
  "github/copilot.vim",
  enabled = not vim.g.vscode,
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<Tab>', 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false
    })
  end
}

