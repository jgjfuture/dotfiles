return {
	'nvim-telescope/telescope.nvim',
	tag = 'v0.2.0',
	dependencies = { 'nvim-lua/plenary.nvim' },
	enabled = not vim.g.vscode,
	config = function()
	end
}
